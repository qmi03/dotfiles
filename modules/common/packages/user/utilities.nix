{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # CLI Utilities
    curl
    wget
    fastfetch
    gitingest
    lolcat
    cmatrix
    nyancat

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
