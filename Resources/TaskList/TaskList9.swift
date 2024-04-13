//
//  TaskList.swift
//  Subtasks
//

import Adwaita

struct TaskList: View {

    @Binding var tasks: [Task]

    var view: Body {
        ScrollView {
            List(tasks) { task in
                ActionRow()
                    .title(task.label)
                    .prefix {
                        CheckButton()
                            .active($tasks[id: task.id, default: .init(label: "")].done)
                            .style("selection-mode")
                            .valign(.center)
                    }
            }
            .valign(.start)
            .padding()
            .style("boxed-list")
        }
    }

}
