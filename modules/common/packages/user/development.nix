{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # Development Tools
    nushell
    fish
    direnv
    lazygit
    git
    lazydocker
    socat
    cmake
    pkg-config

    # Terminal Utilities
    bat
    bottom
    tmux
    tree
    ripgrep
    fzf
    btop
    zoxide
    jq
    oh-my-posh

    # Text Editors/IDEs
    neovim
    neovim-remote

    # Programming Languages & Tools
    ## Typesetting
    typst

    ## Haskell
    ghc

    ## Julia
    julia-bin

    ## Go
    go

    ## C/C++/Python
    mpich
    pixi
    uv

    ## Javascript
    nodejs
    pnpm
    deno
    bun

    ## Zig
    zig

    ## Ruby
    ruby

    ## Lua
    lua

    ## PHP
    php
    php83Packages.composer
    intelephense
    phpactor
    php83Packages.php-cs-fixer

    ## LSP & Development Tools
    ## llvmPackages.clang-tools
    llvmPackages.clang
  ];
}
