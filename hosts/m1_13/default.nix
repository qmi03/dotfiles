{ inputs, globals, ... }:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit inputs globals; };
  inputs.nix-homebrew.darwinModules.nix-homebrew = {
    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;

      # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
      enableRosetta = true;

      # User owning the Homebrew prefix
      user = globals.user;

      # Automatically migrate existing Homebrew installations
      autoMigrate = true;
    };
  };
  modules = [
    globals
    inputs.home-manager.darwinModules.home-manager
    {
      home-manager.users.${globals.user}.imports = [
        inputs.nix-index-database.hmModules.nix-index
      ];
    }
    ../../modules/darwin
  ];
}
