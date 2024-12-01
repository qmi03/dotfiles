{ config, ... }: {
  inputs.nix-homebrew.darwinModules.nix-homebrew = {
    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;

      # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
      enableRosetta = true;

      # User owning the Homebrew prefix
      user = config.username;

      # Automatically migrate existing Homebrew installations
      autoMigrate = true;
    };
  };
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
