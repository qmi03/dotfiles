{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "STIX Two Text" ];
        monospace = [ "JetBrainsMonoNL Nerd Font Mono" ];
        emoji = [ "joypixels" ];
      };
    };

    home.packages = with pkgs; [
      stix-two
      font-awesome
      input-fonts
      joypixels
      nerd-fonts.jetbrains-mono
      open-sans
    ];
  };
}
