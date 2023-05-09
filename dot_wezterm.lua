local wezterm = require 'wezterm'

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

config.unix_domains = {
  {
    name = 'wsl',
    serve_command = { 'wsl', 'wezterm-mux-server', '--daemonize' },
  },
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_gui_startup_args = { 'connect', 'wsl' }
end

return config
