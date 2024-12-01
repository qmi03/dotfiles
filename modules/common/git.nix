{ config, ... }: {
  home-manager.users.${config.user}.programs.git = {
    enable = true;

    userName = "qmi";
    userEmail = "minh.pham1126@gmail.com";

    extraConfig = {
      branch.autosetuprebase = "always";

      core = {
        autocrlf = "input";
        untrackedCache = true;
      };

      init.defaultBranch = "master";
      push.default = "current";

      rebase = {
        autostash = true;
        autosquash = true;
      };

      user.useConfigOnly = true;
    };

    ignores = [
      ".direnv"
      "__pycache__"
      "node_modules"
      "*.log"
      ".DS_Store"
    ];

  };
}
