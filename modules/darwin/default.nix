{ ... }: {
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
  imports = [
    ../common
    ./homebrew.nix
    ./packages.nix
    ./system.nix
    ./touch-id.nix
    ./users.nix
  ];
}
