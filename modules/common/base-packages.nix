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

      oh-my-posh
      direnv
      lazygit
    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
