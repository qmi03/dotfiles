{ config, ... }: {
  programs.zsh.enable = true;

  home-manager.users.${config.user}.home.file = {
    ".zshrc".source = ./zsh/.zshrc;
  };
}
