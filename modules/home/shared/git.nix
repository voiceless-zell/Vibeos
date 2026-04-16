{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    signing.format = "openpgp";
    settings = {
      user = {
        name = "voiceless-zell";
        email = "peter.bouchard2893@proton.me";
      };
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
}
