{ config, ... }: {
  home-manager.users.${config.user}.programs.zathura = {
    enable = true;
    options = {
      # Appearance
      default-bg = "#fdf6e3";
      default-fg = "#657b83";
      statusbar-bg = "#eee8d5";
      statusbar-fg = "#657b83";

      # Behavior
      sandbox = "none";
      selection-clipboard = "clipboard";
      window-title-basename = true;
      adjust-open = "best-fit";

      # Navigation
      page-padding = 1;
      scroll-step = 50;
      scroll-page-aware = true;
      smooth-scroll = true;

      # UI features
      show-scrollbars = true;
      show-hidden = true;
    };

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
    };

    extraConfig = ''
      # Enable copy to clipboard with mouse selection
      set selection-notification false
      
      # Smoother rendering
      set render-loading false
    '';
  };
}
