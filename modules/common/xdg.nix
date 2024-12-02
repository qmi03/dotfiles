{ config, ... }: {
  home-manager.users.${config.user} = {
    xdg = {
      enable = true;
    };
  };
}
