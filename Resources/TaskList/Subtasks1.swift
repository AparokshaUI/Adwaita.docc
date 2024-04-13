// The Swift Programming Language
// https://docs.swift.org/swift-book

import Adwaita

@main
struct Subtasks: App {

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
