{ config, pkgs, ... }:

{
   environment.systemPackages = with pkgs; [
     openconnect
   ];

   networking.openconnect = {
     interfaces = {
        KTH = {
        autoStart = false;
        gateway = "https://vpn.lan.kth.se";
        passwordFile = "/home/nixie/Documents/openconnect";
        protocol = "anyconnect";
        user = "mxvg";
        extraOptions = {
          authgroup = "KTH";
          force-dpd = "5";
        };
      };
     };
   };
}
