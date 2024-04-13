//
//  TaskList.swift
//  Subtasks
//

import Adwaita

struct TaskList: View {

    @Binding var tasks: [Task]

    var view: Body {
        ScrollView {
            list
        }
        .topToolbar {
            HeaderBar.empty()
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
