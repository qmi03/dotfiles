{ inputs, modules ? [ ], ... }:

inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit inputs; };
  modules = [
    {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.hostPlatform = "aarch64-darwin";

      environment.systemPackages = with inputs.nixpkgs.legacyPackages.aarch64-darwin; [
        bat
        btop
        fastfetch
      ];

      # Additional Darwin-specific configurations
      system.stateVersion = 5;
    }
  ] ++ modules;
}
