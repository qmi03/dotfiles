{ config, ... }: {
  home-manager.users.${config.user}.home.file = {
    ".zshrc".source = ./zshrc;
  };
}
