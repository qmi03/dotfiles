{ ... }: {
  imports = [
    ../common
    ./configs
    ./homebrew.nix
    ./environment.nix
    ./packages.nix
    ./system.nix
    ./touch-id.nix
    ./users.nix
    ./networking.nix
  ];
}
