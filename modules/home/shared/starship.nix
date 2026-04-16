{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    settings = {
      scan_timeout = 1000;

      git_branch = {
        symbol = "git:";
      };

      git_status = {
        ahead = "^''${count}";
        behind = "v''${count}";
        diverged = "^''${ahead_count}v''${behind_count}";
        conflicted = "=''${count}";
        deleted = "x''${count}";
        modified = "!''${count}";
        renamed = ">''${count}";
        staged = "+''${count}";
        stashed = "*''${count}";
        untracked = "?''${count}";
      };
    };
  };
}
