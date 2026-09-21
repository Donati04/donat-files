-- ~/.config/hypr/tiling.lua
-- Traduzione di tiling-v2.conf con i dispatcher REALI dell'API Lua
-- (verificati su https://wiki.hypr.land/Configuring/Basics/Dispatchers/).
-- La versione precedente conteneva dispatcher inventati (swapwindow,
-- changegroupactive, bringactivetotop, cyclenext, focus_monitor, ecc. come
-- funzioni root) che non esistono nell'API e causavano "attempt to call a
-- nil value".

local mainMod = "SUPER"

-- Chiudi finestre
hl.bind(mainMod .. " + W", hl.dsp.window.close())

-- Controllo tiling
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- solo dwindle
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Muovi focus con SUPER + frecce
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Workspace 1-10 (SUPER) e sposta finestra (SUPER+SHIFT)
for i = 1, 10 do
	local key = i % 10 -- 10 mappa al tasto 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
	hl.bind(mainMod .. " + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- TAB tra workspace
hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + TAB", hl.dsp.focus({ workspace = "previous" }))

-- Sposta l'intera workspace su un altro monitor (direzione)
hl.bind(mainMod .. " + SHIFT + ALT + left", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + SHIFT + ALT + right", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(mainMod .. " + SHIFT + ALT + up", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(mainMod .. " + SHIFT + ALT + down", hl.dsp.workspace.move({ monitor = "d" }))

-- Scambia finestra con quella adiacente
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "d" }))

-- Cicla tra le finestre della workspace attiva
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + SHIFT + TAB", hl.dsp.window.cycle_next({ prev = true }))

-- Cicla tra i monitor
hl.bind("CTRL + ALT + TAB", hl.dsp.focus({ monitor = "+1" }))
hl.bind("CTRL + ALT + SHIFT + TAB", hl.dsp.focus({ monitor = "-1" }))

-- Ridimensiona finestra attiva (resize relativo, non interattivo)
hl.bind(mainMod .. " + minus", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + equal", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Scorri tra workspace con SUPER + rotella
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Sposta/ridimensiona con SUPER + tasto mouse + trascinamento (interattivo)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Gruppi (tab) di finestre
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + ALT + G", hl.dsp.window.move({ out_of_group = true }))

hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ into_group = "r" }))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ into_group = "u" }))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ into_group = "d" }))

-- Naviga tra le finestre di un gruppo
hl.bind(mainMod .. " + CTRL + left", hl.dsp.group.next({ prev = true }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.group.next())
