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
    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
