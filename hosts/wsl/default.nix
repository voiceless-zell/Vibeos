{ pkgs, ... }:
{
  imports = [
    ../../modules/nixos/base.nix
  ];

  networking.hostName = "wsl";

  system.stateVersion = "24.11";

  wsl.enable = true;
  wsl.defaultUser = "zell";

  users.users.zell = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
