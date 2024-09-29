{
  config,
  pkgs,
  ...
}: {
  home.username = "fvrn";
  home.homeDirectory = "/home/fvrn";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
