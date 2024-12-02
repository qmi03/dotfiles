{ config, ... }: {
  home-manager.users.${config.user} = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
    };
  };
}
