//
//  Subtasks.swift
//  Subtasks
//

import Adwaita

@main
struct Subtasks: App {

    @State private var tasks: [Task] = [
        .init(label: "Hello"),
        .init(label: "World"),
        .init(label: "Complete", done: true)
    ]
    let id = "io.github.david_swift.Subtasks"
    var app: GTUIApp!

    var scene: Scene {
        Window(id: "main") { window in
            Text(Loc.helloWorld)
                .padding()
                .topToolbar {
                    ToolbarView(app: app, window: window)
                }
        }
        .defaultSize(width: 450, height: 300)
    }

}
