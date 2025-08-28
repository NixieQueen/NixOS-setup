{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ hd-idle ];

  systemd.services.hdidle = {
    description = "Service to spin down HDDs after a specified time in idle.";
    wantedBy = [ "multi-user.target" "sleep.target" "post-resume.target" ];
    after = [ "network.target" "suspend.target" "post-resume.target" ];
    serviceConfig = {
      Type = "simple";
      User = "root";
      ExecStart = "${pkgs.hd-idle}/bin/hd-idle -i 120 -a sda -i 120 sdb -i 120 sdc -i 120";
    };
  };
}
