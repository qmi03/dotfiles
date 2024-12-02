{ config, ... }:
{
  home-manager.users.${config.user} = {
    home = {
      file = {
        ".config/wezterm".source = ./wezterm;
      };
    };
    programs.wezterm = {
      enable = true;
    };
  };
}
