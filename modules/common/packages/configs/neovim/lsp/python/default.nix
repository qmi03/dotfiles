{ pkgs, ... }:
{
  programs.neovim = {
    plugins = with pkgs;[
      python312Packages.python-lsp-server
      ruff
      mypy
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./python.lua}
    '';
  };
}
