{ config, pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";
  system = {
    stateVersion = 5;
    keyboard = {
      remapCapsLockToControl = true;
      enableKeyMapping = true;
    };
    activationScripts.applications.text =
      let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
      pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };

      dock = {
        enable-spring-load-actions-on-all-items = true;
        mouse-over-hilite-stack = true;

        mineffect = "genie";
        orientation = "right";
        show-recents = false;
        tilesize = 44;

        persistent-apps = [
        ];
      };

      finder = {
        FXPreferredViewStyle = "clmv";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
      };

      LaunchServices.LSQuarantine = false;

      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.dock" = {
          magnification = true;
          largesize = 48;
        };
        "com.apple.finder" = {
          WarnOnEmptyTrash = false;
          FXDefaultSearchScope = "SCcf";
          FXPreferredViewStyle = "clmv";
        };
      };
    };
  };
}
