{ inputs, globals, ... }:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit inputs globals; };
  modules = [
    globals
    inputs.home-manager.darwinModules.home-manager
    ../../modules/darwin
  ];
}
