{ config, ... }: {
  programs.zsh = {
    enable = true;
  };

  home-manager.users.${config.user}.home.file = {
    ".aerospace.toml".source = ./aerospace.toml;
    ".tmux.conf".source = ./tmux.conf;
    ".zshrc".source = ./zshrc;
  };
}
