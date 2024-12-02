{ config, ... }: {
  home-manager.users.${config.user}.home.file = {
    ".aerospace.toml".source = ./aerospace.toml;
  };
}
