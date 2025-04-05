{ config, pkgs, ... }:

{
  services.samba = {
    enable = true;
    settings = {
      global = {
        security = "user";
        workgroup = "CBH";
      };
    };
    openFirewall = true;
  };

  services.gvfs.enable = true;
}
