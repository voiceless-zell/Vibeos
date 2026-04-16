{ username, hostname, ... }:
{
  imports = [
    ../../modules/nixos/base.nix
  ];

  networking.hostName = hostname;

  system.stateVersion = "24.11";

  wsl.enable = true;
  wsl.defaultUser = username;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
