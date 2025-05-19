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
    nsswins = false;
  };

  services.samba-wsdd = {
    enable = false;
    discovery = false;
    openFirewall = true;
  };

  services.gvfs.enable = true;
}
