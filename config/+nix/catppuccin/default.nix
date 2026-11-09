{ config, ... }: {
  home-manager.users.${config.user} = {
    catppuccin = {
      enable = true;
      autoEnable = true;
      flavor = "mocha";
      accent = "red";
      zathura = {
        flavor = "latte";
      };
    };
  };
}
