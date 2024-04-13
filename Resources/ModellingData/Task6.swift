//
//  Task.swift
//  Subtasks
//

struct Task: Codable {

    var label: String
    var done = false
    var subtasks: [Self] = []

    var mixed: Bool {
        !done && subtasks.contains { subtask in
            subtask.mixed || subtask.done
        }
    }

}
