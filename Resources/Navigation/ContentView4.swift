//
//  ContentView.swift
//  Subtasks
//

import Adwaita

struct ContentView: View {

    @State("tasks") private var tasks: [Task] = []
    @State private var destination: NavigationStack<Task> = .init()
    var app: GTUIApp

    var view: Body {
        NavigationView($destination, "Subtasks") { task in
            Text(task.label)
        } initialView: {
            TaskList(tasks: $tasks, destination: $destination, app: app)
        }
    }

}
