if os_browser != browser_not_a_browser {
	if saved_browser_width != browser_width || saved_browser_height != browser_height {
		saved_browser_width = browser_width
		saved_browser_height = browser_height
		window_set_size(browser_width, browser_height)
	}
}
