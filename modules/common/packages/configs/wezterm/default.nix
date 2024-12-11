{ config, ... }:
{
  home-manager.users.${config.user} = {
    home = {
      file = {
        ".config/wezterm".source = ./wezterm;
      };
    };
  };
}
