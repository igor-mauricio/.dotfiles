local wezterm = require("wezterm")
local act = wezterm.action

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
config.max_fps = 60

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
-- config.macos_window_background_blur = 42
------------------------------------------------------------
-- Font
------------------------------------------------------------
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 17
config.line_height = 1.1
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

------------------------------------------------------------
-- Colors
------------------------------------------------------------
config.color_scheme = "Monokai Soda"
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
local tmux_prefix = { key = " ", mods = "CTRL" }
config.keys = {
	-- Tmux prefix
	{
		key = " ",
		mods = "CTRL",
		action = wezterm.action.SendKey({ key = " ", mods = "CTRL" }),
	},
	-- Close tmux pane/window
	{
		key = "w",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey(tmux_prefix),
			act.SendKey({ key = "x" }), -- kill-window
		}),
	},
	-- Create tmux window
	{
		key = "t",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey(tmux_prefix),
			act.SendKey({ key = "c" }), -- new-window
		}),
	},
	-- Enter tmux search mode
	{
		key = "f",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey(tmux_prefix),
			act.SendKey({ key = "[" }), -- copy-mode
		}),
	},
	-- Manage tmux windows
	{
		key = "w",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }), -- prefix (Ctrl-Space)
			act.SendKey({ key = "w" }), -- choose-tree / window list
		}),
	},
	-- Zoom tmux window
	{
		key = "z",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }), -- prefix (Ctrl-Space)
			act.SendKey({ key = "z" }), -- choose-tree / window list
		}),
	},
	-- Cmd+h/j/k/l → tmux select-pane (prefix + h/j/k/l)
	{
		key = "h",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "h", mods = "CTRL" }),
		}),
	},
	{
		key = "j",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "j", mods = "CTRL" }),
		}),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "k", mods = "CTRL" }),
		}),
	},
	{
		key = "l",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "l", mods = "CTRL" }),
		}),
	},

	-- Cmd+Shift+h/j/k/l → tmux swap-pane (prefix + H/J/K/L)
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }),
			act.SendKey({ key = "H" }),
		}),
	},
	{
		key = "j",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }),
			act.SendKey({ key = "J" }),
		}),
	},
	{
		key = "k",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }),
			act.SendKey({ key = "K" }),
		}),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }),
			act.SendKey({ key = "L" }),
		}),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }), -- tmux prefix (Ctrl-Space)
			act.SendKey({ key = "LeftArrow" }),
		}),
	},

	-- Cmd + Right → tmux prefix + Right
	{
		key = "RightArrow",
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }), -- tmux prefix (Ctrl-Space)
			act.SendKey({ key = "RightArrow" }),
		}),
	},
	{
		key = "LeftArrow",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }), -- tmux prefix (Ctrl-Space)
			act.SendKey({ key = "LeftArrow", mods = "SHIFT" }),
		}),
	},

	-- Cmd + Right → tmux prefix + Right
	{
		key = "RightArrow",
		mods = "CMD|SHIFT",
		action = act.Multiple({
			act.SendKey({ key = " ", mods = "CTRL" }), -- tmux prefix (Ctrl-Space)
			act.SendKey({ key = "RightArrow", mods = "SHIFT" }),
		}),
	},
}
-- Switch tmux window
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CMD",
		action = act.Multiple({
			act.SendKey(tmux_prefix),
			act.SendKey({ key = tostring(i) }), -- window number
		}),
	})
end

-- Inline images
config.enable_kitty_graphics = true

------------------------------------------------------------
-- Shell
------------------------------------------------------------
config.default_prog = { "/bin/zsh", "-l" }

return config
