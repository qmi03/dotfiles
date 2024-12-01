{ lib, pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      curl
      git
      neovim
      wget
      bat
      btop
      cmake
      direnv
      fastfetch
      fzf
      gradle_7
      ghc
      julia_19-bin
      lazygit
      mkalias
      mpich
      # neovim
      nodejs
      oh-my-posh
      pkg-config
      pixi
      pnpm
      qemu
      ripgrep
      speedtest-cli
      spicetify-cli
      stow
      thefuck
      tldr
      tmux
      tree
      uv
      w3m
      zig
      zoxide
      typst
    ];

    variables = {
      EDITOR = lib.getExe pkgs.neovim;
    };
  };
}
