{ inputs, pkgs, ... }:
let
  # You can put the flake inputs in scope by adding them to the list of imports.
  # The names are the same as the attribute names of the inputs in flake.nix.
  inherit (inputs)
    nixpkgs-stable-darwin;
  # Nixpkgs unstable is just a flake, and to get the actual nixpkgs package set,
  # you need to import it. In case you are curious how this works, `import nixpkgs-unstable`
  # evaluates https://github.com/NixOS/nixpkgs/blob/master/default.nix,
  # and then we call the result of that import with an attrset that contains the value system.
  stable-darwin = import nixpkgs-stable-darwin { inherit (pkgs) system; };
in
{
  # Thise is where we can put our overlays.
  # They are a way to modify the packages availabe to you inside the `pkgs` argument of modules.
  # Referrence on them can be foung here: https://nixos.wiki/wiki/Overlays
  nixpkgs.overlays =
    [
      # Simple overlay that doesn't use any arguments, and just exposes the packages from unstable.
      # You can check what packages and version are available in each branch respectively at:
      # https://search.nixos.org/packages
      (_:_: {
        inherit (stable-darwin)
          # sioyek is currently unstable (2.0.0-unstable-2024-09-29), so we need to use an overlay to get the stable version.
          sioyek;
      })
    ];
}
