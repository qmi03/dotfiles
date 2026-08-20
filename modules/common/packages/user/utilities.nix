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
    ffmpeg
    fd
    speedtest-go
    aria2
    p7zip
    torsocks
    wget2
    yt-dlp
    mpv
    tldr
    hblock
  ];
}
