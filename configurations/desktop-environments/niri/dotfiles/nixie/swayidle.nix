{ pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-plugin;
  };
  
  services.swayidle =
    let
      # Lock command
      lock = "${pkgs.swaylock-plugin}/bin/swaylock-plugin --daemonize --grace 30sec";
      displayoff = "${pkgs.systemd}/bin/systemctl suspend";
      displaysleep = "${pkgs.systemd}/bin/systemctl sleep";
      lightoff = "${pkgs.light}/bin/light -O; ${pkgs.light}/bin/light -S 0";
      lighton = "${pkgs.light}/bin/light -I";
      # Hyprland
      # display = status: "hyprctl dispatch dpms ${status}";
      # Niri
      # display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in
      {
        enable = true;
        timeouts = [
          {
            timeout = 100; # in seconds
            command = lightoff;
            resumeCommand = lighton;
          }
          {
            timeout = 300;
            command = lock;
          }
          {
            timeout = 400;
            command = displayoff;
          }
          {
            timeout = 500;
            command = displaysleep;
          }
        ];
        events = [
          {
            event = "before-sleep";
            # adding duplicated entries for the same event may not work
            command = displayoff + "; " + lock;
          }
          {
            event = "after-resume";
            command = lighton;
          }
          {
            event = "lock";
            command = displayoff + "; " + lock;
          }
          {
            event = "unlock";
            command = lighton;
          }
        ];
      };

}
