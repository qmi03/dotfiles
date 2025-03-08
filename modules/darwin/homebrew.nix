{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap" # Aerospace
    ];
    brews = [
      "mas"
      "swiftformat"
      "exercism"
      "unisonlang"
      "postgresql@17"
      "llvm"
    ];
    casks = [
      # utility
      "aerospace"
      # "raycast"
      "keycastr"
      "lulu"
      "openkey"
      "omnidisksweeper"
      # "betterdisplay"
      # "dozer"
      "lmms"

      # essentials
      "arc"
      "zen-browser@twilight"
      "iina"
      # "qbittorrent"
      "macfuse"
      "soulseek"

      # dev
      "ghostty"
      "vscodium"
    ];
    masApps = {
      # Example
      # "Yoink": id
      "Focus" = 1258530160; # Focus to Do
      "Plain Text Editor" = 1572202501;
    };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--verbose" ];
    };
  };
}
