{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = "k";
        "move_down" = "j";
        "move_left" = "h";
        "move_right" = "l";
        "screen_down" = [ "d" "<C-d>" ];
        "screen_up" = [ "u" "<C-u>" ];
      };
      config = {
        "background_color" = "1.0 1.0 1.0";
        "text_highlight_color" = "1.0 0.0 0.0";
      };
    };
  };
}
