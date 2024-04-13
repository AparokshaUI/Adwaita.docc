Window(id: "example") { _ in
    StatusPage("Hello, world!", description: "Adwaita for Swift")
        .topToolbar {
            HeaderBar()
                .showTitle(false)
        }
}
.defaultSize(width: 300, height: 300)