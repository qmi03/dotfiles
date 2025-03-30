{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap" # Aerospace
      "smudge/smudge" # nightlight
    ];
    brews = [
      "mas"
      "swiftformat"
      "exercism"
      "unisonlang"
      "postgresql@17"
      "kew"
      "nightlight"
      "mpv"
      "imagemagick"
      "llvm"
      "lf"
      "coursier"
      "gh"
      "fileicon"
    ];
    casks = [
      # utility
      "aerospace"
      "keycastr"
      "lulu"
      "openkey"
      "omnidisksweeper"
      "wireshark"
      "android-studio"
      "inkscape"
      "ollama"
      "gimp"
      "marta"
      "karabiner-elements"
      "alt-tab"
      # "raycast"
      # "betterdisplay"
      # "dozer"

      # music
      "lmms"
      "mos"

      # essentials
      "zen-browser@twilight"
      "google-chrome"
      "iina"
      "qbittorrent"
      "macfuse"
      "soulseek"

      # dev
      "ghostty"
      "docker"
    ];
    masApps = {
      # Example
      # "Yoink": id
      "Focus" = 1258530160; # Focus to Do
      "Plain Text Editor" = 1572202501;
      "Goodnotes 6" = 1444383602;
      "Readest" = 6738622779;
    };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--verbose" ];
    };
  };
}
