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
      "thefuck"
      "kew"
      "nightlight"
      "mpv"
      "imagemagick"
      "llvm"
    ];
    casks = [
      # utility
      "aerospace"
      # "raycast"
      "chromium"
      "keycastr"
      "lulu"
      "openkey"
      "omnidisksweeper"
      # "betterdisplay"
      # "dozer"
      "lmms"
      "mos"
      "wireshark"
      "android-studio"
      "openmtp"
      "inkscape"
      "ollama"

      # essentials
      "zen-browser@twilight"
      "iina"
      "qbittorrent"
      "macfuse"
      "soulseek"

      # dev
      "ghostty"
      "vscodium"
      "emacs"
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
