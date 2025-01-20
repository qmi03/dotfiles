{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    # Dev
    ## Tools
    nushell
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
    audacity
    ffmpeg
    thc-hydra
    libusb1
    zathura
    lazydocker
    i3
    kitty
    stow


    speedtest-cli
    # spicetify-cli
    w3m
    # spotify
    ## Programming Languages
    typst
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
    deno
    ### zig
    zig

    ### lua
    lua
  ];
}
