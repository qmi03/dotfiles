{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMonoNL Nerd Font Mono" ];
        emoji = [ "JoyPixels" ];
      };
    };

    home.packages = with pkgs; [
      font-awesome
      input-fonts
      joypixels
      nerd-fonts.jetbrains-mono
      open-sans
    ];
  };
}
