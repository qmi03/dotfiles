{ config, ... }: {
  home-manager.users.${config.user} = {
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "red";
      zathura = {
        flavor = "latte";
      };
    };
  };
}
