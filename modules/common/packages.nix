{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    bat
    stow
    tmux
    tree
    ripgrep
    fzf
    btop
    direnv
    mkalias
    fastfetch
    gradle_7
    ghc
    julia_19-bin
    lazygit
    mpich
    nodejs
    oh-my-posh
    pixi
    pnpm
    speedtest-cli
    spicetify-cli
    thefuck
    uv
    w3m
    zig
    zoxide
    typst
  ];
}
