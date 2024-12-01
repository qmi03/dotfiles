{ config, ... }: {
  home-manager.users.${config.user}.home.file = {
    ".config".source = ./.config;
  };
}
