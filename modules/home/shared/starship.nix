{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {
      scan_timeout = 1000;
    };
  };
}
