//
//  Subtasks.swift
//  Subtasks
//

import Adwaita

@main
struct Subtasks: App {

    let id = "io.github.david_swift.Subtasks"
    var app: GTUIApp!

    var scene: Scene {
        Window(id: "main") { _ in
            ContentView(app: app)
        }
    }

}
