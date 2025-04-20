{ config, ... }: {
  home-manager.users.${config.user}.programs.zathura = {
    enable = true;
    mappings = {
      # Common navigation shortcuts
      "<Left>" = "navigate previous";
      "<Right>" = "navigate next";
      "J" = "scroll half-down";
      "K" = "scroll half-up";
      # Rotate document
      "r" = "rotate rotate_cw";
      "R" = "rotate rotate_ccw";
      # Zoom controls
      "+" = "zoom in";
      "-" = "zoom out";
      "=" = "zoom default";
      # Toggle fullscreen
      "f" = "toggle_fullscreen";
      # Reload document
      "<C-r>" = "reload";
      # Toggle page mode (single/multiple pages)
      "d" = "toggle_page_mode";
      # Toggle recolor mode (for dark/light switch)
      "i" = "recolor";
    };
    extraConfig = ''
      # Enable copy to clipboard with mouse selection
      set selection-notification false

      set selection-clipboard "clipboard"
      set window-title-basename true
      set adjust-open "best-fit"
      set page-padding 1
      set scroll-step 100
      set scroll-hstep 100
      set zoom-step 5
      set show-hidden true
      set font "monospace normal 18"
      set render-loading true
      set database "sqlite"
    '';
  };
}
