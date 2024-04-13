//
//  ContentView.swift
//  Subtasks
//

import Adwaita

struct ContentView: View {

    @State("tasks") private var tasks: [Task] = []
    @State private var destination: NavigationStack<Binding<Task>> = .init()
    var app: GTUIApp

    var view: Body {
        NavigationView($destination, "Subtasks") { task in
            TaskList(tasks: task.subtasks, destination: $destination, app: app) {
                tasks.delete(id: task.wrappedValue.id)
            }
        } initialView: {
            TaskList(tasks: $tasks, destination: $destination, app: app)
        }
    }

}
