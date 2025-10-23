{ pkgs, config, ... }:
{
  home-manager.users.${config.user} = {
    programs.neovim = {
      enable = false;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    home = {
      packages = with pkgs; [
        astro-language-server
        marksman
        mdx-language-server
        swiftlint
        cmake-language-server
        cmake
        eslint_d
        gopls
        jdt-language-server
        lemminx
        nil
        nixpkgs-fmt
        prettierd
        svelte-language-server
        taplo
        typescript-language-server
        vue-language-server
        zls
        checkmake
        markdownlint-cli
        texlab
        tailwindcss-language-server
        # typst
        tinymist
        typstfmt
        typstyle
        # lua
        lua-language-server
        stylua
        # yaml
        yamlfmt
        # docker
        dockerfile-language-server
        docker-compose-language-service
        # python
        python312Packages.python-lsp-server
        python312Packages.jedi
        python312Packages.pylsp-mypy
        ruff
        mypy
        isort

        # php
        phpactor
        php83Packages.php-cs-fixer

        # emmet
        emmet-language-server
      ];
    };
  };
}
