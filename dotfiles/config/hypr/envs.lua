-- ~/.config/hypr/envs.lua
-- Variabili d'ambiente per sessione Wayland pulita.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Cursor size
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Forza le app a usare Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Migliora lo screen sharing (Google Meet, Discord, ecc.)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- XCompose file (per caratteri speciali via tasto Compose)
hl.env("XCOMPOSEFILE", "~/.XCompose")

-- XWayland: forza scaling a 1 per evitare problemi con app X11 su schermi HiDPI
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

-- Non mostrare le notizie di aggiornamento al primo avvio
hl.config({
    ecosystem = {
        no_update_news = true,
    },
})
