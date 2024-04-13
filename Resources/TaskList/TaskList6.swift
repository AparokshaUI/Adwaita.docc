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
                Text(task.label)
            }
            .padding()
        }
    }

}
