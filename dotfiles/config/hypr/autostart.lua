-- ~/.config/hypr/autostart.lua
-- Programmi avviati all'inizio della sessione.

hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle")

	hl.exec_cmd("mako")

	hl.exec_cmd("waybar")

	hl.exec_cmd("swayosd-server -s ~/.config/swayosd/style.css")

	hl.exec_cmd("swaybg -i ~/.config/theme/background -m fill")

	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")

	hl.exec_cmd("fcitx5 --disable notificationitem")

	hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f 1)")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
end)
