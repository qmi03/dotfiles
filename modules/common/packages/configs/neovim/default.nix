{ pkgs, lib, config, ... }:
let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in
{
  imports = [
    ./lsp
  ];
  home-manager.users.${config.user} = {
    home = {
      packages = with pkgs;[
        swiftlint
        typstfmt
        tinymist
        vimPlugins.vim-clang-format
        cmake-language-server
        cmake
        emmet-language-server
        eslint_d
        gopls
        jdt-language-server
        lemminx
        lua-language-server
        nil
        nixpkgs-fmt
        prettierd
        rust-analyzer
        stylua
        svelte-language-server
        taplo
        typescript-language-server
        vue-language-server
        zls
      ];
      file = {
        ".config/nvim".source = ./nvim;
      };
    };
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      # vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
