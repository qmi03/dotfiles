{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # CLI Utilities
    curl
    wget
    tldr
    fastfetch
    stow
    gitingest
    w3m

    # System Utilities
    qemu
    libusb1
    thc-hydra

    # File Management
    localsend

    # Terminal Emulators
    kitty
    wezterm
  ];
}
