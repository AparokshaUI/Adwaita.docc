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
    var app: GTUIApp

    var view: Body {
        ScrollView {
            list
        }
        .topToolbar {
            HeaderBar.start {
                Button(icon: .default(icon: .listAdd)) {
                    showAddDialog = true
                    focusEntry.signal()
                }
                .keyboardShortcut("n".ctrl(), app: app)
                .tooltip(Loc.addTooltip)
            }
        }
        .dialog(visible: $showAddDialog.onSet { _ in cancel() }, id: "add") {
            dialog
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
