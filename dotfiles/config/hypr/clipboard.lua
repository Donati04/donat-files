-- ~/.config/hypr/clipboard.lua

local mainMod = "SUPER"

hl.bind(mainMod .. " + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "Insert", window = "activewindow" }))
hl.bind(mainMod .. " + V", hl.dsp.send_shortcut({ mods = "SHIFT", key = "Insert", window = "activewindow" }))
hl.bind(mainMod .. " + X", hl.dsp.send_shortcut({ mods = "CTRL", key = "X", window = "activewindow" }))

-- Gestore clipboard grafico
--hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd(""))
