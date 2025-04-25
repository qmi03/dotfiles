{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # Chat
    vesktop

    # Document Viewers
    zathura

    # Note-taking & Productivity
    obsidian

    # Media Applications
    audacity
    ffmpeg

    # Gaming
    melonDS
  ];
}
