local vars = require("vars")

hl.on("hyprland.start", function()
	hl.exec_cmd(vars.browser)
	hl.exec_cmd("vesktop")
	hl.exec_cmd("fcitx5 -d")
end)
