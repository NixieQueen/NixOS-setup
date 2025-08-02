{ inputs, pkgs, ... }:

# This has to be ran through the home manager
{
  wayland.windowManager.hyprland = {
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    enable = true;
    xwayland.enable = true;
    plugins = [
      #inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
      #inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];
    settings = {
      "$hyprpath" = "~/.config/hypr/hyprland";
      "$pluginpath" = "$hyprpath/plugins";
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
        "$hyprpath/workspaces.conf"
        "$hyprpath/themes/nixie.conf"
        "$pluginpath/hyprbars.conf"
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
        Type = "simple";
        ExecStart = "/home/nixie/.config/swww/BackgroundManager";
        IOSchedulingClass = "idle";
      };
    };

    timers.wallpaperTimer = {
      Unit = {Description = "Set wallpaper based on time of day using swww";};

      Timer = {OnUnitActiveSec = "1h";};

      Install = {WantedBy = ["timers.target"];};
    };

    services.hyprwindowhandle = {
      Install = {WantedBy = ["graphical-session.target"];};

      Unit = {
        Description = "Handle hyprland window attaching and deattaching events";
        After = ["graphical-session-pre.target"];
        PartOf = ["graphical-session.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "/home/nixie/.config/hypr/HyprWindowHandle";
        IOSchedulingClass = "idle";
      };
    };

  };

  # Hypridle setup
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        before_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          timeout = 60;
          on-timeout = "light -O && light -S 0";
          on-resume = "light -I";
        }
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 400;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 500;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  # Hyprlock setup
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 15;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      image = [
        {
          size = 270;
          path = "~/.config/hypr/hyprland/profile.svg";
          position = "0, 50";
        }
      ];

      label = [
        {
          text = "cmd[update:1000] echo $(date +%H:%M:%S)";
          position = "0, 400";
          halign = "center";
          valign = "center";
          text_align = "center";
          font_family = "Fira Sans Bold";
          font_size = 69;
        }
        {
          text = "cmd[update:100000] echo $(date +%_d)th of $(date +%B), $(date +%A)";
          position = "0, 300";
          halign = "center";
          valign = "center";
          text_align = "center";
          font_family = "Fira Sans Bold";
          font_size = 48;
        }
        {
          text = "$USER";
          position = "0, -160";
          halign = "center";
          valign = "center";
          text_align = "center";
          font_family = "Fira Sans Bold";
          font_size = 48;
        }
      ];

      input-field = [
        {
          size = "400, 90";
          position = "0, -280";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "Your password please :3";
          #shadow_passes = 2;
        }
      ];
    };
  };
}
