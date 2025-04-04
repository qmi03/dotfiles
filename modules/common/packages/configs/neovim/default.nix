{ pkgs, config, ... }:
{
  imports = [
    ./lsp
  ];
  home-manager.users.${config.user} = {
    home = {
      packages = with pkgs;[
        swiftlint
        cmake-language-server
        cmake
        emmet-language-server
        eslint_d
        gopls
        jdt-language-server
        lemminx
        nil
        nixpkgs-fmt
        prettierd
        rust-analyzer
        svelte-language-server
        taplo
        typescript-language-server
        vue-language-server
        zls
        checkmake
        markdownlint-cli
        texlab
        bash-language-server
        tailwindcss-language-server
        # typst
        tinymist
        typstyle
        # lua
        lua-language-server
        stylua
        # yaml
        yamlfmt

        # php
        phpactor
        php83Packages.php-cs-fixer

        # emmet
        emmet-language-server
      ];
    };
    # programs.neovim = {
    #   enable = true;
    #   defaultEditor = true;
    #   viAlias = true;
    #   # vimAlias = true;
    #   vimdiffAlias = true;
    #   plugins = with pkgs.vimPlugins;[
    #     lazy-nvim
    #   ];
    #   # See this for a more in depth explanation on how to make Lazy work together with Nix
    #   # https://nixalted.com/
    #   extraLuaConfig = ''
    #     require("vim_opts")
    #     vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
    #     require("lazy").setup({
    #     spec = {
    #     { import = "plugins" },
    #     },
    #       performance = {
    #         reset_packpath = false,
    #         rtp = {
    #             reset = false,
    #           }
    #         },
    #       dev = {
    #         path = "${pkgs.vimUtils.packDir config.home-manager.users.${config.user}.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
    #       },
    #       install = {
    #         -- Safeguard in case we forget to install a plugin with Nix
    #         missing = false,
    #       },
    #     })
    #   '';
    # };
    # xdg.configFile."nvim/lua" = {
    #   recursive = true;
    #   source = ./lua;
    # };
  };
}
