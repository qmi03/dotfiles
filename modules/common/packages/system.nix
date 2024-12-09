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
      wezterm
      nerd-fonts.code-new-roman 
    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
