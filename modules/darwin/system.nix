{ config, ... }:
{
  nix = {
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 0;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      input-fonts.acceptLicense = true;
      joypixels.acceptLicense = true;
    };
    hostPlatform = "aarch64-darwin";
  };

  system = {
    primaryUser = config.user;
    stateVersion = 5;
    keyboard = {
      remapCapsLockToControl = false;
      enableKeyMapping = true;
    };
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
        orientation = "bottom";
        show-recents = false;
        tilesize = 44;

        persistent-apps = [
        ];
      };

      finder = {
        AppleShowAllFiles = false;
        ShowStatusBar = true;
        ShowPathbar = true;

        FXDefaultSearchScope = "SCcf";
        FXRemoveOldTrashItems = true;
        FXPreferredViewStyle = "Nlsv";
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;

        CreateDesktop = true;
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;

        _FXShowPosixPathInTitle = true;
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
