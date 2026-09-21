-- ~/.config/hypr/input.lua
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        kb_layout = "it",
        kb_variant = "",
        kb_model = "",
        kb_options = "compose:caps",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 = nessuna modifica

        touchpad = {
		    natural_scroll = true,
        },
    },
})

hl.config({
    misc = {
        key_press_enables_dpms = true,   -- un tasto riattiva lo schermo
        mouse_move_enables_dpms = true,  -- il mouse riattiva lo schermo
    },
})
