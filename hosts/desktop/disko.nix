{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-uuid/c8924046-9c56-44b7-904b-4bcc772ff6b7";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              end = "1024M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              name = "root";
              end = "-0";
              content = {
                type = "filesystem";
                format = "f2fs";
                mountpoint = "/";
                extraArgs = [
                  "-O"
                  "-i"
                  "extra_attr,inode_checksum,sb_checksum,compression"
                ];
                mountOptions = [
                  "compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime,nodiscard"
                ];
              };
            };
          };
        };
      };
    };
  };
}
