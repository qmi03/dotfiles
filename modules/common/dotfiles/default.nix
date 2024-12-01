{ config, ... }: {
  home-manager.users.${config.user}.home.file = {
    ".config".source = ./.config;
    ".aerospace".source = ./.aerospace.toml;
    ".tmux.conf".source = ./.tmux.conf;
  };
}
