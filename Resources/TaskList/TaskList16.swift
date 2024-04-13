//
//  TaskList.swift
//  Subtasks
//

import Adwaita

struct TaskList: View {

    @Binding var tasks: [Task]
    @State private var showAddDialog = false

    var view: Body {
        ScrollView {
            list
        }
        .topToolbar {
            HeaderBar.start {
                Button(icon: .default(icon: .listAdd)) {
                    showAddDialog = true
                }
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
        Text("Hello, world!")
            .padding()
            .topToolbar {
                HeaderBar.empty()
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

}
