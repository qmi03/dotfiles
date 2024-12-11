{ config, ... }: {
  home-manager.users.${config.user} = {
    news.json.output = { };
  };
}
