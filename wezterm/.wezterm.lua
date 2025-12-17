local wezterm = require("wezterm")

local config = {}

-- Use config builder if available (newer WezTerm versions)
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.foreground_text_hsb = {
	hue = 1.00, -- 1.0 = no change
	saturation = 1.1, -- 30% more saturation
	brightness = 1.1, -- 10% brighter
}

------------------------------------------------------------
-- Performance
------------------------------------------------------------
config.front_end = "WebGpu" -- best on macOS
config.webgpu_power_preference = "HighPerformance"
config.animation_fps = 60
config.max_fps = 120

------------------------------------------------------------
-- Window appearance
------------------------------------------------------------
config.window_decorations = "MACOS_FORCE_ENABLE_SHADOW|RESIZE"
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 0,
}

config.window_frame = {
	border_left_width = "2px",
	border_right_width = "2px",
	border_bottom_height = "2px",
	border_top_height = "2px",
	border_left_color = "#3E3E3E",
	border_right_color = "#3E3E3E",
	border_bottom_color = "#3E3E3E",
	border_top_color = "#3E3E3E",
}
config.adjust_window_size_when_changing_font_size = false

-- True transparency
config.window_background_opacity = 0.70
config.macos_window_background_blur = 32
------------------------------------------------------------
-- Font
------------------------------------------------------------
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16
config.line_height = 1.1

------------------------------------------------------------
-- Colors
------------------------------------------------------------
config.color_scheme = "Catppuccin Mocha"
--
-- local config = {}
config.bold_brightens_ansi_colors = true
config.colors = {
	background = "#000000",
}

------------------------------------------------------------
-- Tabs
------------------------------------------------------------
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

------------------------------------------------------------
-- Scrollback
------------------------------------------------------------
config.scrollback_lines = 10000

------------------------------------------------------------
-- Clipboard
------------------------------------------------------------
config.enable_wayland = false
config.selection_word_boundary = " \t\n{}[]()\"'`"
------------------------------------------------------------
-- Copy mode (vim-like)
------------------------------------------------------------
config.keys = {
	{
		key = " ",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = " ", mods = "CTRL" }),
	},
}
-- Inline images
config.enable_kitty_graphics = true

------------------------------------------------------------
-- Shell
------------------------------------------------------------
config.default_prog = { "/bin/zsh", "-l" }

return config
