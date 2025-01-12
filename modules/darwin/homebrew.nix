{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
      "nextfire/tap"
      "th-ch/youtube-music"
      "koekeishiya/formulae"
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
      "yabai"
    ];
    casks = [
      "aerospace"
      "arc"
      "zen-browser@twilight"
      "betterdisplay"
      "bettertouchtool"
      # "dozer"
      "iina"
      "keycastr"
      "lulu"
      "openkey"
      # "qbittorrent"
      # "raycast"
      "atomic-wallet"
      "macfuse"
      "soulseek"
      "ghostty"
      "youtube-music"
      "vscodium"
      "omnidisksweeper"
    ];
    masApps = {
      # Example
      # "Yoink": id
      "Focus" = 1258530160;
      "Plain Text Editor" = 1572202501;
    };
    onActivation = {
      cleanup = "zap";
      # autoUpdate = true;
      # upgrade = true;
      extraFlags = [ "--verbose" ];
    };
  };
}
