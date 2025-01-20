{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
      "nextfire/tap"
    ];
    brews = [
      "mas"
      "swiftformat"
      "deno"
      "sqlite"
      "apple-music-discord-rpc"
      "exercism"
      "unisonlang"
      "postgresql@17"
    ];
    casks = [
      "aerospace"
      "arc"
      "zen-browser@twilight"
      "iina"
      "keycastr"
      "lulu"
      "openkey"
      # "qbittorrent"
      # "raycast"
      "macfuse"
      "soulseek"
      "ghostty"
      "vscodium"
      "omnidisksweeper"
      # "betterdisplay"
      # "dozer"
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
