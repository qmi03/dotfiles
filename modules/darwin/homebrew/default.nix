{ ... }: {
  homebrew = {
    enable = true;
    taps = [
      "nikitabobko/tap" # Aerospace
      "smudge/smudge" # nightlight
      "FelixKratz/formulae" # borders
      "kegworks-app/kegworks" # kegworks
      "arleypadua/homebrew-pkhex-cli" # pkhex
    ];

    # Configuration for all homebrew
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
      extraFlags = [ "--verbose" ];
    };
  };

  imports = [
    ./brews.nix
    ./casks.nix
    ./mas.nix
  ];
}
