//
//  TaskList.swift
//  Subtasks
//

import Adwaita

struct TaskList: View {

    @Binding var tasks: [Task]
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
            }
        }
        .dialog(visible: $showAddDialog, id: "add") {
            dialog
        }
    }

    var list: View {
        List(tasks, selection: nil) { task in
            taskRow(task: task)
        }
        .valign(.start)
        .padding(20)
        .style("boxed-list")
        .frame(maxWidth: 500)
    }

    var dialog: View {
        Form {
            EntryRow("Label", text: $addDialogText)
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
                Button("Cancel") {
                    cancel()
                }
            } end: {
                Button("Add") {
                    add()
                }
                .style("suggested-action")
            }
            .showEndTitleButtons(false)
        }
    }

    func taskRow(task: Task) -> View {
        ActionRow()
            .title(task.label)
            .prefix {
                CheckButton()
                    .active($tasks[id: task.id, default: .init(label: "")].done)
                    .style("selection-mode")
                    .valign(.center)
            }
            .suffix {
                ButtonContent()
                    .iconName(Icon.default(icon: .goNext).string)
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
