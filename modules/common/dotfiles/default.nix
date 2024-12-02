{ config, ... }: {
  programs.zsh = {
    enable = true;
  };

  home-manager.users.${config.user}.home.file = {
    ".tmux.conf".source = ./tmux.conf;
    ".zshrc".source = ./zshrc;
  };
}
