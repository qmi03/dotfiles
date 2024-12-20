{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # Dev
    ## Tools
    direnv
    lazygit
    bat
    bottom
    tmux
    tree
    ripgrep
    fzf
    btop
    fastfetch
    oh-my-posh
    zoxide
    jq
    sioyek
    obsidian
    ## Programming Languages
    # typst
    typst
    ### Java
    gradle_7
    ### Haskell
    ghc
    ### Julia
    julia_19-bin
    ### C/C++/Python
    mpich
    pixi
    uv
    ### Javascript
    nodejs
    pnpm
    ### zig
    zig
    # General
    speedtest-cli
    spicetify-cli
    w3m
  ];
}
