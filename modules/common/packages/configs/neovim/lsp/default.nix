{ ... }: {
  imports = [
    ./python
  ];
  # home-manager.users.${config.user}.home.packages = with pkgs.vimPlugins;[
  #   nvim-lspconfig
  # ];
}
