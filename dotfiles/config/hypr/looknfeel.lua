-- ~/.config/hypr/looknfeel.lua
-- Traduzione diretta del vecchio looknfeel.conf.
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		-- true = ridimensiona trascinando bordi/gap
		resize_on_border = false,
		-- vedi https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ prima di attivare
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		shadow = {
			enabled = true,
			range = 2,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			special = true,
			brightness = 0.60,
			contrast = 0.75,
		},
	},
})

-- Gruppi di finestre (tab)
hl.config({
	group = {
		col = {
			border_active = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			border_inactive = "rgba(595959aa)",
			border_locked_active = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			border_locked_inactive = "rgba(595959aa)",
		},
		groupbar = {
			font_size = 12,
			font_family = "monospace",
			font_weight_active = "ultraheavy",
			font_weight_inactive = "normal",
			indicator_height = 0,
			indicator_gap = 5,
			height = 22,
			gaps_in = 5,
			gaps_out = 0,
			text_color = "rgb(ffffff)",
			text_color_inactive = "rgba(ffffff90)",
			col = {
				active = "rgba(00000040)",
				inactive = "rgba(00000020)",
			},
			gradients = true,
			gradient_rounding = 0,
			gradient_round_only_edges = false,
		},
	},
})

-- Animazioni: curve
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.config({
	animations = {
		enabled = true,
	},
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
-- Le transizioni tra workspace erano disabilitate (0,0) nell'originale
hl.animation({ leaf = "workspaces", enabled = false, speed = 0, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert" })

-- Layout dwindle
-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
	dwindle = {
		preserve_split = true,
		force_split = 2,
	},
})

hl.config({
	scrolling = {
		column_width = 0.49,
	},
})

-- Layout master
-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
	master = {
		new_status = "master",
	},
})

-- Varie
hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		disable_scale_notification = true,
		focus_on_activate = true,
		anr_missed_pings = 3,
		on_focus_under_fullscreen = 1,
	},
})

-- Cursore
hl.config({
	cursor = {
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
	},
})

-- Nasconde automaticamente lo scratchpad cambiando workspace
hl.config({
	binds = {
		hide_special_on_workspace_change = true,
	},
})
