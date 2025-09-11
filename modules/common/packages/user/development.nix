{ config, pkgs, ... }:
{
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # Development Tools
    fish
    direnv
    lazygit
    git
    pre-commit
    socat
    cmake
    pkg-config
    scrcpy
    android-tools
    silicon

    # Terminal Utilities
    bat
    bottom
    tmux
    tree
    ripgrep
    fzf
    btop
    zoxide
    oh-my-posh

    # Text Editors/IDEs
    neovim
    neovim-remote

    # Programming Languages & Tools
    ## Typesetting
    typst
    typsite

    ## Haskell
    ghc

    ## Julia
    julia-bin

    ## Go
    go

    ## C/C++/Python
    mpich

    ## Javascript
    nodejs
    pnpm
    deno
    bun

    ## Zig
    zig

    ## Ruby
    ruby

    ## Rust
    rustup

    ## Lua
    lua

    ## PHP
    # php
    # php83Packages.composer
    # intelephense
    # phpactor
    # php83Packages.php-cs-fixer

    ## LSP & Development Tools
    ## llvmPackages.clang-tools
    llvmPackages.clang
  ];
}
