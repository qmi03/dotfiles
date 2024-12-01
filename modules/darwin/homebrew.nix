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
      "betterdisplay"
      "bettertouchtool"
      "docker"
      "dozer"
      "iina"
      "keycastr"
      "lulu"
      "obsidian"
      "onlyoffice"
      "openkey"
      "qbittorrent"
      "raycast"
      "sioyek"
      "wezterm@nightly"
    ];
    masApps = {
      # Example
      # "Yoink": id
      "Focus" = 1258530160;
      "Plain Text Editor" = 1572202501;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
