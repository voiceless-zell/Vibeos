{ pkgs, username, homeDirectory, hostname, ... }:
{
  imports = [
    ../../modules/home/shared/stylix.nix
    ../../modules/home/shared/gtk.nix
    ../../modules/home/shared/nvf.nix
    ../../modules/home/shared/zsh.nix
    ../../modules/home/shared/starship.nix
    ../../modules/home/shared/git.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.zsh.shellAliases = {
    fl = "cd /home/zell/.openclaw/workspace/vibeos/ && v";
    fr = "nh os switch --hostname ${hostname}";
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
