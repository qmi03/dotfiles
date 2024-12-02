{ config, ... }:
let
  userConfig = home-manager.users.${config.user};
in
{
  userConfig = {
    home = {
      file = {
        ".config/oh-my-posh".source = ./themes;
      };
    };

    programs.zsh.initExtra = ''
    '';
    ### TODO: Modify the home-manager source code for oh-my-posh to support other file type like toml
    # programs.oh-my-posh = {
    #   enable = true;
    #   enableZshIntegration = true;
    #   settings =
    #     builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "''${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"));
    # };
  };
}
