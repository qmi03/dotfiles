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
      mkalias
      nerd-fonts.code-new-roman 
      just
    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
