local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.ssh_domains = {
  {
    name = 'ebimen',
    remote_address = 'ebimen',
    username = 'co3k',
  },
  {
    name = 'ebitea-1',
    remote_address = 'ebitea-1',
    username = 'co3k',
  },
}

config.keys = {
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard'},
  { key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_gui_startup_args = { 'connect', 'ebitea-1' }
end

return config
