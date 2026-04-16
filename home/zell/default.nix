{ pkgs, ... }:
{
  imports = [
    ../../modules/home/shared/stylix.nix
    ../../modules/home/shared/nvf.nix
    ../../modules/home/shared/zsh.nix
    ../../modules/home/shared/starship.nix
  ];

  home.username = "zell";
  home.homeDirectory = "/home/zell";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.zsh.shellAliases = {
    fl = "cd ~/vibeos/ && v";
  };

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
