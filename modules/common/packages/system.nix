{ lib, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      # Core utilities
      curl
      wget
      vim
      neovim
      git

      # Build tools
      cmake
      pkg-config

      # System tools
      qemu

      # Documentation
      tldr

      # Mac-specific
      mkalias

      # Task runners
      just
    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
