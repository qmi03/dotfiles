{ pkgs, config, ... }:
{
  home-manager.users.${config.user} = {
    home = {
      packages = with pkgs;[
        swiftlint
        vimPlugins.vim-clang-format
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
        # typst
        typstfmt
        tinymist
        # lua
        lua-language-server
        stylua
      ];
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      # vimAlias = true;
      vimdiffAlias = true;
      plugins = with pkgs.vimPlugins;[
        lazy-nvim
      ];
      # See this for a more in depth explanation on how to make Lazy work together with Nix
      # https://nixalted.com/
      extraLuaConfig = ''
        require("vim_opts")
        vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
        require("lazy").setup({
        spec = {
        { import = "plugins" },
        },
          performance = {
            reset_packpath = false,
            rtp = {
                reset = false,
              }
            },
          dev = {
            path = "${pkgs.vimUtils.packDir config.home-manager.users.${config.user}.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
          },
          install = {
            -- Safeguard in case we forget to install a plugin with Nix
            missing = false,
          },
        })
      '';
    };
    xdg.configFile."nvim/lua" = {
      recursive = true;
      source = ./lua;
    };
  };
  imports = [
    ./lsp
  ];
}
