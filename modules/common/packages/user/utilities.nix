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
    fd
    speedtest-go
    aria2
    p7zip
    torsocks
    wget2
  ];
}
