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
        hidePodcasts
        shuffle
        skipStats
        keyboardShortcut
        trashbin
        popupLyrics
        fullAppDisplay
      ];
      # enabledCustomApps = with spicePkgs.apps; [
      #   ncsVisualizer
      #   localFiles
      #   marketplace
      #   reddit
      #   lyricsPlus
      #   historyInSidebar
      #   betterLibrary
      # ];
      theme = spicePkgs.themes.comfy;
    };
  };
}
