{ config, ... }: {
  home-manager.users.${config.user}.home.file = {
    ".tmux.conf".source = ./tmux.conf;
  };
}
