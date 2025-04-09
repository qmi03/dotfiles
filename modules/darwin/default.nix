{ ... }: {
  imports = [
    ../common
    ./configs
    ./homebrew
    ./environment.nix
    ./packages
    ./system.nix
    ./touch-id.nix
    ./users.nix
    ./networking.nix
  ];
}
