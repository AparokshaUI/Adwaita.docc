//
//  TaskList.swift
//  Subtasks
//

import Adwaita

struct TaskList: View {

    @Binding var tasks: [Task]
    @Binding var destination: NavigationStack<Binding<Task>>
    @State private var showAddDialog = false
    @State private var addDialogText = ""
    @State private var focusEntry: Signal = .init()
    @State private var showDeleteDialog = false
    var app: GTUIApp
    var deleteTask: (() -> Void)?

    var view: Body {
        ScrollView {
            list
        }
        .topToolbar {
            HeaderBar {
                Button(icon: .default(icon: .listAdd)) {
                    showAddDialog = true
                    focusEntry.signal()
                }
                .keyboardShortcut("n".ctrl(), app: app)
                .tooltip(Loc.addTooltip)
            } end: {
                if deleteTask != nil {
                    Button(icon: .default(icon: .userTrash)) {
                        showDeleteDialog = true
                    }
                    .tooltip(Loc.deleteTooltip)
                }
            }
        }
        .dialog(visible: $showAddDialog.onSet { _ in cancel() }, id: "add") {
            dialog
        }
        .alertDialog(visible: $showDeleteDialog, heading: Loc.deleteTitle, body: Loc.deleteDescription, id: "delete")
        .response(Loc.cancel, role: .close) { }
        .response(Loc.delete, appearance: .destructive, role: .default) {
            deleteTask?()
        }
    }

    var list: View {
        List(tasks, selection: nil) { task in
            taskRow(task: $tasks[id: task.id, default: .init(label: "")])
        }
        .valign(.start)
        .padding(20)
        .style("boxed-list")
        .frame(maxWidth: 500)
    }

    var dialog: View {
        Form {
            EntryRow(Loc.label, text: $addDialogText)
                .entryActivated {
                    add()
                }
                .frame(minWidth: 250)
                .focus(focusEntry)
        }
        .padding(20)
        .valign(.start)
        .topToolbar {
            HeaderBar {
                Button(Loc.cancel) {
                    cancel()
                }
            } end: {
                Button(Loc.add) {
                    add()
                }
                .style("suggested-action")
            }
            .showEndTitleButtons(false)
        }
    }

    func taskRow(task: Binding<Task>) -> View {
        ActionRow()
            .title(task.wrappedValue.label)
            .prefix {
                CheckButton()
                    .active(task.done)
                    .inconsistent(task.wrappedValue.mixed)
                    .style("selection-mode")
                    .valign(.center)
            }
            .suffix {
                ButtonContent()
                    .iconName(Icon.default(icon: .goNext).string)
            }
            .activatableWidget {
                Button()
                    .activate {
                        destination.push(task)
                    }
            }
    }

    func cancel() {
        showAddDialog = false
        addDialogText = ""
    }

    func add() {
        tasks.append(.init(label: addDialogText))
        cancel()
    }

}
