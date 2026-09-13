local wezterm = require 'wezterm'

return {
  ---------------------------------------------------------------------------
  -- Fonts
  ---------------------------------------------------------------------------
  font = wezterm.font("LiterationMono Nerd Font"),
  font_size = 13.0,
--  line_height = 1.0,                     -- line height
--  cell_width = 1.0,                      -- cell width ratio
--  bold_brightens_ansi_colors = true,     -- bold text brightens ANSI colors

  ---------------------------------------------------------------------------
  -- Colors & Appearance
  ---------------------------------------------------------------------------
  color_scheme = "Catppuccin Mocha",
--  window_background_opacity = 1.0,         -- window background opacity
--  text_background_opacity = 1.0,           -- text background opacity
  enable_tab_bar = false,
--  hide_tab_bar_if_only_one_tab = false,    -- hide tab bar if only one tab

  ---------------------------------------------------------------------------
  -- Window Behavior
  ---------------------------------------------------------------------------
  initial_rows = 36,                       -- default rows
  initial_cols = 120,                       -- default columns
--  window_decorations = "TITLE | RESIZE",   -- window decorations (title bar, resizable)
--  adjust_window_size_when_changing_font_size = true, -- adjust window size when changing font size

  ---------------------------------------------------------------------------
  -- Tabs & Panes
  ---------------------------------------------------------------------------
--  use_fancy_tab_bar = true,                -- use fancy tab bar
--  tab_max_width = 16,                      -- maximum tab width
--  inactive_pane_hsb = {                    -- inactive pane brightness/saturation
--    saturation = 1.0,
--    brightness = 1.0,
--  },

  ---------------------------------------------------------------------------
  -- Keys & Mouse
  ---------------------------------------------------------------------------
--  disable_default_key_bindings = false,    -- disable default key bindings
--  keys = {},                               -- custom key bindings (default empty)
--  mouse_bindings = {},                     -- mouse bindings (default empty)

  ---------------------------------------------------------------------------
  -- Scrolling & Output
  ---------------------------------------------------------------------------
--  scrollback_lines = 3500,                 -- scrollback buffer lines
--  enable_scroll_bar = false,               -- show scroll bar

  ---------------------------------------------------------------------------
  -- SSH & Remote
  ---------------------------------------------------------------------------
--  ssh_domains = {},                        -- SSH domains (default empty)
--  unix_domains = {},                       -- Unix domain sockets (default empty)

  ---------------------------------------------------------------------------
  -- Startup & Commands
  ---------------------------------------------------------------------------
--  default_prog = {},                       -- default program (e.g. bash/zsh)
--  launch_menu = {},                        -- launch menu (default empty)

  ---------------------------------------------------------------------------
  -- Behavior
  ---------------------------------------------------------------------------
--  check_for_updates = true,                -- check for updates
--  exit_behavior = "CloseOnCleanExit",      -- exit behavior
--  warn_about_missing_glyphs = true,        -- warn about missing glyphs
}
