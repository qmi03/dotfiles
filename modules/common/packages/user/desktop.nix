{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # Document Viewers
    zathura

    # Note-taking & Productivity
    obsidian

    # Gaming
    melonDS
  ];
}
