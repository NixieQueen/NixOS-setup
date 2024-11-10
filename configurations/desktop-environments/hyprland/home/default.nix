{ inputs, pkgs, user, ... }:

# This has to be ran through the home manager
{
  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    enable = true;
    xwayland.enable = true;
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
    ];
    settings = {
      "$hyprpath" = "~/.config/hypr/hyprland";
      source = [
        "$hyprpath/environment-variables.conf"
        "$hyprpath/startup-apps.conf"
        "$hyprpath/inputs.conf"
        "$hyprpath/dwindle.conf"
        "$hyprpath/keys.conf"
        "$hyprpath/monitors.conf"
        "$hyprpath/window-rules.conf"
        "$hyprpath/animations.conf"
        "$hyprpath/misc.conf"
        "$hyprpath/performance.conf"
        "$hyprpath/xwayland.conf"
        "$hyprpath/themes/nixie.conf"
      ];
    };
  };

  systemd.user = {
    services.wallpaperTimer = {
      Install = {WantedBy = ["graphical-session.target"];};

      Unit = {
        Description = "Set wallpaper based on time of day using swww";
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target"];
      };

      Service = {
        Type = "oneshot";
        ExecStart = "/home/${user}/.config/swww/BackgroundManager";
        IOSchedulingClass = "idle";
      };
    };

    timers.wallpaperTimer = {
      Unit = {Description = "Set wallpaper based on time of day using swww";};

      Timer = {OnUnitActiveSec = "1h";};

      Install = {WantedBy = ["timers.target"];};
    };
  };
}
