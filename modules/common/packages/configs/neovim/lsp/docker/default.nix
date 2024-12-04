{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      dockerfile-language-server-nodejs
      docker-compose-language-service
    ];
    programs.neovim = {
      extraLuaConfig = ''
        ${builtins.readFile ./docker.lua}
      '';
    };
  };
}
