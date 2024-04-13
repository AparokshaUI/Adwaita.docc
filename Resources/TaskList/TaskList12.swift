//
//  TaskList.swift
//  Subtasks
//

import Adwaita

struct TaskList: View {

    @Binding var tasks: [Task]

    var view: Body {
        ScrollView {
            List(tasks, selection: nil) { task in
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
            .valign(.start)
            .padding(20)
            .style("boxed-list")
            .frame(maxWidth: 500)
        }
        .topToolbar {
            HeaderBar.empty()
        }
    }

}
