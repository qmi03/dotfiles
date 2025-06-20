{
  description = "qmi's configuration for both nixos and macos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    apple-silicon-support = {
      url = "github:oliverbestmann/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    typsite.url = "github:Glomzzz/typsite";
  };

  outputs = inputs:
    let
      globals = {
        user = "qmi";
      };
    in
    rec
    {
      nixosConfigurations = {
        home_desktop = import ./hosts/home_desktop { inherit inputs globals; };
      };
      darwinConfigurations = {
        m1-13 = import ./hosts/m1-13 { inherit inputs globals; };
      };
      homeConfigurations = {
        home_desktop = nixosConfigurations.home_desktop.config.home-manager.users.${globals.user}.home;
        m1-13 = darwinConfigurations.m1-13.config.home-manager.users.${globals.user}.home;
      };
    };
}
