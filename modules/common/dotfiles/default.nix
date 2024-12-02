{ config, ... }: {
  programs.zsh = {
    enable = true;
  };

  home-manager.users.${config.user}.home.file = {
    ".config".source = ./xdg-config;
    ".aerospace.toml".source = ./aerospace.toml;
    ".tmux.conf".source = ./tmux.conf;
    ".zshrc".source = ./zshrc;
  };
}
