//
//  ContentView.swift
//  Subtasks
//

import Adwaita

struct ContentView: View {

    @State("tasks") private var tasks: [Task] = []
    var app: GTUIApp

    var view: Body {
        Text("Hello, world!")
            .padding()
    }

}
