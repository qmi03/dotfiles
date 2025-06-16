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
        # docker
        dockerfile-language-server-nodejs
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
