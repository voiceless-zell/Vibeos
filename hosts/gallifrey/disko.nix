{
  # TODO: confirm the actual NVMe install target, e.g. /dev/nvme0n1.
  systemDisk ? "/dev/disk/by-id/TODO-system-nvme",
  # TODO: confirm the actual capacity disks, e.g. /dev/sda and /dev/sdb.
  dataDiskA ? "/dev/disk/by-id/TODO-data-disk-a",
  dataDiskB ? "/dev/disk/by-id/TODO-data-disk-b",
  ...
}:
{
  disko.devices = {
    disk = {
      system = {
        type = "disk";
        device = systemDisk;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            swap = {
              size = "16G";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            };
            nixos = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                  "/persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "compress=zstd" "noatime" ];
                  };
                };
              };
            };
          };
        };
      };

      dataA = {
        type = "disk";
        device = dataDiskA;
        content = {
          type = "gpt";
          partitions.data = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "bulk";
            };
          };
        };
      };

      dataB = {
        type = "disk";
        device = dataDiskB;
        content = {
          type = "gpt";
          partitions.data = {
            size = "100%";
            content = {
              type = "mdraid";
              name = "bulk";
            };
          };
        };
      };
    };

    mdadm.bulk = {
      type = "mdadm";
      level = 0;
      metadata = "1.2";
      content = {
        type = "btrfs";
        extraArgs = [ "-f" ];
        mountpoint = "/srv";
        mountOptions = [ "compress=zstd" "noatime" ];
      };
    };
  };
}
