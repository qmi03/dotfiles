{ config,  ... }:
{
  home-manager.users.${config.user} = {
    home = {
      file = {
        ".config/oh-my-posh".source = ./themes;
      };
    };

    programs.oh-my-posh = {
      settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile "./themes/tokyonight_storm.qmi.toml"));
    };
    ### TODO: Modify the home-manager source code for oh-my-posh to support other file type like toml
    # programs.oh-my-posh = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   settings =
    #     builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "''${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"));
    # };
  };
}
