-- ~/.config/hypr/windows.lua
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Ignora le richieste "maximize" da tutte le app
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix per alcuni problemi di drag con XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Opacità di default per tutte le finestre (finestra attiva, finestra inattiva)
hl.window_rule({
	name = "default-opacity",
	match = { class = ".*" },
	opacity = "1.0 1.0",
})

hl.window_rule({
	match = { class = "^(org.gnome.Evince|org.gnome.Calculator)$" },
	float = true,
	size = { 800, 600 },
	center = true,
})

hl.window_rule({
	match = { class = "^tui$" },
	float = true,
	size = { 900, 700 },
	center = true,
})
