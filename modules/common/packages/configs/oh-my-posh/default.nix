{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.oh-my-posh = {
      settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile "./themes/tokyonight_storm.qmi.toml"));
    };
  };
}
