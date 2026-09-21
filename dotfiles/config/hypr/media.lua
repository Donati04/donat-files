-- ~/.config/hypr/media.lua
-- Tasti multimediali: volume, luminosità, riproduzione.
--
-- Pacchetti richiesti: wireplumber (per wpctl), brightnessctl, playerctl.
-- Opzionale: swayosd per l'OSD grafico (vedi nota in fondo).

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 100%"), { locked = true })
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%"), { locked = true })

-- Retroilluminazione tastiera: dipende dal driver, es. asus::kbd_backlight.
-- Adatta il device con: brightnessctl -l
hl.bind(
	"XF86KbdBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -d $(brightnessctl -l | grep kbd | head -1 | grep -oP \"'\\K[^']+\") set +33%"),
	{ locked = true }
)
hl.bind(
	"XF86KbdBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -d $(brightnessctl -l | grep kbd | head -1 | grep -oP \"'\\K[^']+\") set 33%-"),
	{ locked = true }
)

-- Richiede playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--   swayosd-client --output-volume raise
--   swayosd-client --output-volume lower
--   swayosd-client --output-volume mute-toggle
--   swayosd-client --brightness raise
--   swayosd-client --brightness lower
