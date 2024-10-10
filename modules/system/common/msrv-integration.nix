{ 
  lib,
  config,
  pkgs,
  ... 
}: 
{
  options = {
    msrv.mount.documents = lib.mkEnableOption "mounts msrv:/srv/documents to /doc";
    msrv.mount.video = lib.mkEnableOption "mounts msrv:/srv/video to /vid";
    msrv.mount.iso = lib.mkEnableOption "mounts msrv:/srv/iso to /iso";
    msrv.mount.music = lib.mkEnableOption "mounts msrv:/srv/mus to /mus";
    msrv.mount.pictures = lib.mkEnableOption "mounts msrv:/srv/pic to /pic";
  };

  config = {
    fileSystems."/doc" = {
      device = "192.168.1.2:/srv/docs";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/vid" = {
      device = "192.168.1.2:/srv/video";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/iso" = {
      device = "192.168.1.2:/srv/iso";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/mus" = {
      device = "192.168.1.2:/srv/music";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/pic" = {
      device = "192.168.1.2:/srv/music";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };
  };
}