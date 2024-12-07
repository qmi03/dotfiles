{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      python312Packages.python-lsp-server
      ruff
      mypy
    ];
    programs.neovim = {
      extraLuaConfig = ''
        ${builtins.readFile ./python.lua}
      '';
    };
  };
}
