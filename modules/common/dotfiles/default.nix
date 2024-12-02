{ config, ... }: {
  programs.zsh = {
    enable = true;
  };

  home-manager.users.${config.user}.home.file = {
    ".config/exercism".source = ./xdg-config/exercism;
    ".config/wezterm".source = ./xdg-config/wezterm;
    ".aerospace.toml".source = ./aerospace.toml;
    ".tmux.conf".source = ./tmux.conf;
    ".zshrc".source = ./zshrc;
  };
}
