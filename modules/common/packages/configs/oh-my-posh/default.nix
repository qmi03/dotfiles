{ config, pkgs, ... }:
let
  migratedConfig = pkgs.runCommand "migrate-oh-my-posh-config" { } ''
    ${pkgs.oh-my-posh}/bin/oh-my-posh config migrate --config ${./themes/tokyonight_storm.qmi.toml} --format json > $out
  '';
in
{
  home-manager.users.${config.user} = {
    home = {
      file = {
        ".config/oh-my-posh".source = ./themes;
      };
    };
    # programs = {
    #   oh-my-posh = {
    #     enable = true;
    #     settings = builtins.fromJSON (builtins.readFile migratedConfig);
    #   };
    # };
  };
}
