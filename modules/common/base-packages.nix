{ lib, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      curl
      git
      vim
      neovim
      wget
      cmake
      pkg-config
      qemu
      tldr

    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
