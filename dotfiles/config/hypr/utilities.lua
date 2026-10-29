-- ~/.config/hypr/utilities.lua
-- Menu, notifiche, screenshot, lock e altre utility.

-- Pacchetti richiesti:
-- hyprshot, hyprpicker, wlogout (o hyprlock+wlogout), mako (makoctl),
-- gnome-calculator (opzionale).

local mainMod = "SUPER"

-- ===== Menu / launcher =====
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("~/.local/bin/system")) -- menu di sistema (logout/shutdown/reboot/lock)

hl.bind("XF86PowerOff", hl.dsp.exec_cmd("~/.local/bin/system"))

hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))

-- ===== Aspetto =====
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar")) -- toggle barra (richiede supporto SIGUSR1 nel tuo waybar/script)
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd("hyprctl keyword decoration:active_opacity 1.0")) -- NOTA: toggle vero va scriptato, qui solo esempio

-- ===== Notifiche (mako) =====
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"))
hl.bind(mainMod .. " + CTRL + COMMA", hl.dsp.exec_cmd("makoctl mode -t do-not-disturb")) -- toggle silenziamento
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("makoctl invoke"))
hl.bind(mainMod .. " + SHIFT + ALT + COMMA", hl.dsp.exec_cmd("makoctl restore"))

-- ===== Toggle idle/nightlight =====
-- NOTA: "toggle locking on idle" era uno script omarchy che abilita/disabilita
-- hypridle al volo. Qui un'alternativa semplice: uccide/riavvia hypridle.
hl.bind(mainMod .. " + CTRL + I", hl.dsp.exec_cmd("pkill hypridle || hypridle"))
-- Nightlight nativo Hyprland (hyprsunset, se installato)
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("pkill hyprsunset || hyprsunset"))

-- ===== Lid switch (multi-monitor: spegni schermo interno quando esterno collegato) =====
-- Adatta "eDP-1" al nome reale del tuo pannello interno (hyprctl monitors)
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor 'eDP-1, disable'"), { locked = true })
hl.bind(
	"switch:off:Lid Switch",
	hl.dsp.exec_cmd("hyprctl keyword monitor 'eDP-1, preferred, auto, auto'"),
	{ locked = true }
)

-- ===== Screenshot / registrazione (hyprshot) =====
hl.layer_rule({
	name = "selezione-senza-animazioni",
	match = { namespace = "^(selection|hyprpicker)$" },
	no_anim = true,
	dim_around = false,
	blur = false,
})

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m output")) -- NOTA: screen recording va gestito con wf-recorder, non incluso qui
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprpicker -a")) -- color picker
hl.bind(mainMod .. " + CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only")) -- NOTA: senza OCR reale; per OCR vero serve tesseract + script

-- ===== File sharing =====
-- NOTA: omarchy-menu share lanciava un picker per condivisione rapida (es. localsend).
-- Sostituito con lancio diretto di localsend, se installato.
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("localsend"))

-- ===== Info via notifica (senza waybar) =====
hl.bind(
	mainMod .. " + CTRL + ALT + T",
	hl.dsp.exec_cmd("notify-send -u low \"$(date +'%A %H:%M · %d %B %Y · Week %V')\"")
)
hl.bind(
	mainMod .. " + CTRL + ALT + B",
	hl.dsp.exec_cmd('notify-send -u low "$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo N/A)%"')
)

-- ===== Pannelli di controllo =====
hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd("alacritty -e wiremix"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("nm-connection-editor"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("alacritty -e btop"))

-- ===== Zoom =====
hl.bind(
	mainMod .. " + CTRL + Z",
	hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')")
)
hl.bind(mainMod .. " + CTRL + ALT + Z", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- ===== Lock =====
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
