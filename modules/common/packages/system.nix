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

      # Task runners
      just
    ];

  };
}
