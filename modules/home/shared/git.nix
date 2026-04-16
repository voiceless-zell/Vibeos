{ ... }:
{
  programs.git = {
    enable = true;
    delta.enable = true;
    lfs.enable = true;
    settings.user = {
      name = "voiceless-zell";
      email = "peter.bouchard2893@proton.me";
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
