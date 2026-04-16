{ pkgs, ... }:
{
  imports = [
    ../../modules/home/shared/stylix.nix
    ../../modules/home/shared/gtk.nix
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
    cowsay
    eza
    fd
    lazygit
    ripgrep
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
