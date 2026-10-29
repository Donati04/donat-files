-- ~/.config/hypr/bindings.lua
-- Bind per lanciare le app principali.

local terminal = "alacritty"
local fileManager = "nautilus --new-window"
local browser = "firefox"

local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .. " -e nvim"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal .. " -e btop"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(terminal .. " -e lazydocker"))

-- Tiling / workspace / focus / gruppi finestre → vedi tiling.lua
-- Utility (screenshot, menu, lock, ecc) → vedi utilities.lua
-- Media/volume/luminosità → vedi media.lua
