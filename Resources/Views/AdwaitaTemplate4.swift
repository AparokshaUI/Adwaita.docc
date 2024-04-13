// The Swift Programming Language
// https://docs.swift.org/swift-book

import Adwaita

@main
struct AdwaitaTemplate: App {

    let id = "io.github.AparokshaUI.AdwaitaTemplate"
    var app: GTUIApp!

    var scene: Scene {
        Window(id: "main") { window in
            Content(app: app, window: window)
        }
        .defaultSize(width: 450, height: 300)
    }

}

struct Content: View {

    @State private var startAlign = false
    var app: GTUIApp
    var window: GTUIApplicationWindow

    var view: Body {
        Button("Toggle Start Alignment") {
            startAlign.toggle()
        }
        .padding()
        .valign(.center)
        .halign(startAlign ? .start : .center)
        .topToolbar {
            ToolbarView(app: app, window: window)
        }
    }

}
