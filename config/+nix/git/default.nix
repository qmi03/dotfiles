{ config, ... }: {
  home-manager.users.${config.user}.programs.git = {
    enable = true;

    settings = {
      user = {
        name = "qmi";
        email = "minh.pham1126@gmail.com";
        useConfigOnly = true;
      };

      branch.autosetuprebase = "always";

      core = {
        autocrlf = "input";
        untrackedCache = true;
        editor = "nvim";
      };

      init.defaultBranch = "master";
      push.default = "current";

      rebase = {
        autostash = true;
        autosquash = true;
      };
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
