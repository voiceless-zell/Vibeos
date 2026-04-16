{ pkgs, ... }:
{
  home.username = "zell";
  home.homeDirectory = "/home/zell";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    bat
    eza
    fd
    ripgrep
  ];

  home.sessionVariables = {
    EDITOR = "nano";
  };
}
