{ config, lib, ... }: {
  imports = [
    ./fonts.nix
    ./nix-index.nix
    ./nix.nix
    ./timezone.nix
    ./xdg.nix
    ./dotfiles
    ./packages
    ./catppuccin.nix
  ];

  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${config.user}.home.stateVersion = "25.05";
  };

  options = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };

    personal.enable = lib.mkEnableOption "Personal setup";
  };

  # # TODO
  # config.home-manager.users.${config.user}.home.sessionVariables = {
  #   # QT_QPA_PLATFORM = "wayland-egl";
  #   # QT_STYLE_OVERRIDE = "Adwaita-dark";

  #   # CARGO_HOME = "${config.xdg.stateHome}/cargo";
  #   # GOPATH = "${config.xdg.stateHome}/go";
  #   # npm_config_cache = "${config.xdg.cacheHome}/npm";
  #   # LESSHISTFILE = "-";
  # };
}
