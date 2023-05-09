local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = {"wsl.exe", "~", "-d", "Ubuntu-22.04"}
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

return config
