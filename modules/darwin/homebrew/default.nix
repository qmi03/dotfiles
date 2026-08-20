{ lib, ... }:
{
  homebrew = {
    enable = true;
    taps =
      lib.map
        (tap: {
          name = tap;
          trusted = true;
          force_auto_update = true;
        })
        [
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
    # ./mas.nix
  ];
}
