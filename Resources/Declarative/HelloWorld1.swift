// The status page
let page = adw_status_page_new()
adw_status_page_set_title(page?.opaque(), "Hello, world!")
adw_status_page_set_description(page?.opaque(), "Adwaita for Swift")

// The header bar view
let headerBar = adw_header_bar_new()
adw_header_bar_set_show_title(headerBar?.opaque(), 0)

// The toolbar view
let contentView = adw_toolbar_view_new()
adw_toolbar_view_set_content(contentView?.opaque(), page)
adw_toolbar_view_add_top_bar(contentView?.opaque(), headerBar)

// The window
let window = adw_application_window_new(app?.pointer?.cast())
adw_application_window_set_content(window?.cast(), contentView)
gtk_window_set_default_size(window?.cast(), 300, 300)
gtk_window_present(window?.cast())
