{ config, pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  home-manager.users.${config.user} = {
    imports = [
      inputs.spicetify-nix.homeManagerModules.spicetify
    ];
    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        shuffle
        keyboardShortcut
        trashbin
        fullAppDisplay
      ];
      enabledCustomApps = with spicePkgs.apps; [
        ncsVisualizer
        marketplace
        lyricsPlus
      ];
      theme = spicePkgs.themes.comfy;
    };
  };
}
