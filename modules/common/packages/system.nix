{ lib, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      # Core utilities
      curl
      wget
      vim
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

  };
}
