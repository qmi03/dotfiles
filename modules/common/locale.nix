{ config, ... }: {
  home-manager.users.${config.user}.home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    # LC_TIME = "fr_FR.UTF-8";
  };
}
