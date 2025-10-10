{ inputs, pkgs, ... }:
let
  # Nixpkgs unstable is just a flake, and to get the actual nixpkgs package set,
  # you need to import it. In case you are curious how this works, `import nixpkgs-unstable`
  # evaluates https://github.com/NixOS/nixpkgs/blob/master/default.nix,
  # and then we call the result of that import with an attrset that contains the value system.
  stable-darwin = import inputs.nixpkgs-stable-darwin { inherit (pkgs) system; };
in
{
  # Thise is where we can put our overlays.
  # They are a way to modify the packages availabe to you inside the `pkgs` argument of modules.
  # Referrence on them can be foung here: https://nixos.wiki/wiki/Overlays
  nixpkgs.overlays = [
    (final: prev: {
      inherit (stable-darwin)
        # Get specific packages from stable-darwin
        julia-bin
        ;
      tmux = prev.tmux.overrideAttrs (old: {
        src = inputs.tmux-git;
        version = "git-${inputs.tmux-git.shortRev or "dirty"}";

        # tmux needs autogen to be run for git builds
        preConfigure = ''
          sh autogen.sh
        '';

        # Add autoconf/automake to build inputs
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [
          final.autoconf
          final.automake
          final.pkg-config
        ];
      });
      typsite = inputs.typsite.packages.${prev.system}.default;
    })
    inputs.neovim-nightly-overlay.overlays.default
  ];
}
