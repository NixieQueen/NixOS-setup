{ config, pkgs, ... }:

{
  services.printing = {
    enable = true;
    #drivers = [ pkgs.cnijfilter2 pkgs.gutenprint pkgs.hplipWithPlugin ];
    drivers = [ pkgs.gutenprint pkgs.hplipWithPlugin ];
  };
  avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
    };
  };
}
