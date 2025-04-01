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
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha"; # Matches your catppuccin setup

      # Some useful extensions
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
        fullAppDisplay
        skipStats
      ];

      # Optional: Customize Spicetify settings
      #       settings = {
      #         inject_css = true;
      #         replace_colors = true;
      #         overwrite_assets = true;
      #       };
    };
  };
}
