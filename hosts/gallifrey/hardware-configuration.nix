{ lib, ... }:
{
  # TODO: replace these generic placeholders with the real generated file after install:
  #   nixos-generate-config --show-hardware-config > hosts/gallifrey/hardware-configuration.nix
  # Keep this file lightweight for now so the host skeleton is evaluable before the machine exists.

  boot.initrd.availableKernelModules = [
    # TODO: confirm if additional storage/network modules are required for the target hardware.
    "ahci"
    "nvme"
    "sd_mod"
    "xhci_pci"
  ];

  boot.kernelModules = [ "kvm-intel" ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
