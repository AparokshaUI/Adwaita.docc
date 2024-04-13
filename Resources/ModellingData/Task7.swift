//
//  Task.swift
//  Subtasks
//

import Foundation

struct Task: Codable, Identifiable {

    var id: UUID = .init()
    var label: String
    var done = false
    var subtasks: [Self] = []

    var mixed: Bool {
        !done && subtasks.contains { subtask in
            subtask.mixed || subtask.done
        }
    }

}
