{ inputs, globals, ... }:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit inputs globals; };
  modules = [
    globals
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.users.${globals.user}.imports = [
        inputs.nix-index-database.homeModules.nix-index
        inputs.catppuccin.homeModules.catppuccin
      ];
    }
    inputs.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        # Install Homebrew under the default prefix
        enable = true;

        # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta
        enableRosetta = true;

        # User owning the Homebrew prefix
        user = globals.user;

        autoMigrate = true;
      };
    }
    ../../modules/common
    ../../modules/darwin
  ];
}
