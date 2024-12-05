{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      mypy
      python312Packages.python-lsp-server
      python312Packages.jedi
      python312Packages.pylsp-mypy
      ruff
      mypy
      isort
    ];
    programs.neovim = {
      extraLuaConfig = ''
        ${builtins.readFile ./python.lua}
      '';
    };
  };
}
