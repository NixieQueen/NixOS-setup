{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ hd-idle ];

  systemd.services.hdparm = {
    description = "Service to spin down HDDs after a specified time in idle.";
    wantedBy = [ "multi-user.target" "sleep.target" "post-resume.target" ];
    after = [ "network.target" "suspend.target" "post-resume.target" ];
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      ExecStart = "${pkgs.hd-idle}/bin/hd-idle -i 60 -a sda -i 60 sdb -i 60 sdc -i 60";
    };
  };
}
