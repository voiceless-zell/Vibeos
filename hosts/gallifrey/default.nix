{ pkgs, lib, inputs, hostname, username, ... }:
{
  imports = [
    ../../modules/nixos/base.nix
    inputs.disko.nixosModules.disko
    ./disko.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = hostname;

  networking.useNetworkd = true;
  systemd.network.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault true;

  users.users.${username} = {
    isNormalUser = true;
    description = "Zell";
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    btrfs-progs
    git
    mdadm
    tmux
  ] ++ [
    inputs.nixos-anywhere.packages.${pkgs.system}.default
  ];

  system.stateVersion = "24.11";
}
