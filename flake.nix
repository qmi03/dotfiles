{
  description = "qmi's configuration for both nixos and macos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nix-darwin, nixos-hardware... }:

    let
      mkDarwinSiliconSystem = import ./hosts/darwin/silicon/default.nix;
      mkNixOSSystem = import ./hosts/nixos/home_pc/default.nix;
      sharedModules = [
        ./modules/common.nix
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.phamvoquangminh = import ./home.nix;
          };
        }
      ];
    in
    {
      nixosConfigurations."home_pc" = mkNixOSSystem {
        inherit inputs;
        modules = sharedModules ++ [
          nixos-hardware.nixosModules.common-gpu-nvidia
          ./modules/nixos/desktop.nix
          ./modules/nixos/nvidia.nix
        ];
      };
      darwinConfigurations."silicon" = mkDarwinSystem {
        inherit inputs;
        modules = sharedModules ++ [
          nix-homebrew.darwinModules.nix-homebrew
          ./modules/darwin/homebrew.nix
        ];
      };
    };
};
}
