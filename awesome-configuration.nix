# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
    user="nixie";
    hostname="awesomeNixie";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Allow unfree stuffs, required for printer
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
    ];
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
       automatic = true;
       dates = "weekly";
       options = "--delete-older-than 7d";
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    fira-sans
  ];

  # Use the GRUB boot loader.
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader = {
	grub = {
		enable = true;
		efiSupport = true;
        useOSProber = true;
        #theme = grubThemes.bigsur-grub2-theme;
        theme = "${
                (pkgs.fetchFromGitHub {
                  owner = "Teraskull";
                  repo = "bigsur-grub2-theme";
                  rev = "b80ac7ee396de54a09e8693b2d86a8b77b1d5098";
                  sha256 = "tJe9VMFfODdu0Sz4TAwNKqiNi/TNEzoYytlMlhXtaco=";
                })}/bigsur/";
		device = "nodev";
		configurationLimit = 5;
	};
	efi = {
		efiSysMountPoint = "/boot/efi";
		canTouchEfiVariables = true;
	};
	timeout = 5;
  };
  networking.hostName = hostname; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
	defaultLocale = "en_US.UTF-8";
	extraLocaleSettings = {
		LC_TIME = "nl_NL.UTF-8";
		LC_MONETARY = "nl_NL.UTF-8";
	};
  };
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkDefault "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable Xserver and use gnome & gdm
  services.xserver = {
    enable = true;

    displayManager = {
      gdm.enable = false;
      #defaultSession = "none+awesome";
      lightdm = {
        enable = true;
        greeters.slick = {
          enable = true;
          draw-user-backgrounds = true;
          extraConfig = "background=~/.config/awesome/themes/nixie-theme/backgrounds/MountainDragon.png";
          iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
          };
          theme = {
            package = pkgs.gnome-themes-extra;
            name = "Adwaita";
            #name = "palenight";
            #package = pkgs.palenight-theme;
          };
          cursorTheme = {
            name = "Numix-Cursor";
            package = pkgs.numix-cursor-theme;
          };
          font = {
            package = pkgs.fira-code;
          };
        };
      };
    };

    desktopManager = {
      gnome.enable = false;
    };
    windowManager = {
      awesome = {
        enable = true;
        package = pkgs.awesome-git;
        luaModules = with pkgs.luaPackages; [
          luarocks
        ];
      };
    };
  };  

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  security = {
    polkit = {
      enable = true;
    };

    rtkit = {
      enable = true;
    };
  };

  # Making a service file for gnome-polkit
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Pulseaudio needs to be disabled
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = false;
      disableWhileTyping = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "scanner" "lp" "video" "audio" "networkmanager" ]; # Enable ‘sudo’ for the user.
    initialPassword = "nixie";
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      emacs = "doom run";
    };

    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      luaPackages.luarocks
      eog
      emacs
      firefox
      wget
      neofetch
      kitty
      polkit_gnome
      polkit
      playerctl
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    light.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    #zsh.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      # enableSSHSupport = true;
    };
    steam.enable = true;
    gamemode.enable = true;
  };
 
  # Enable printing scanners
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = false;
    hsphfpd.enable = false;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };

  location = {
    latitude = 52.3;
    longitude = 4.9;
  };

  services = {
    upower = {
      enable = true;
    };
    tlp = {
      enable = true;
      settings = {
        TLP_ENABLE = 1;

        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "guided";
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        TLP_DEFAULT_MODE = "BAT";

        CPU_SCALING_MIN_FREQ_ON_AC = 400000;
        CPU_SCALING_MAX_FREQ_ON_AC = 4971000;
        CPU_SCALING_MIN_FREQ_ON_BAT = 400000;
        CPU_SCALING_MAX_FREQ_ON_BAT = 3000000;

        CPU_MIN_PERF_ON_AC = 400000;
        CPU_MAX_PERF_ON_AC = 4971000;
        CPU_MIN_PERF_ON_BAT = 400000;
        CPU_MAX_PERF_ON_BAT = 1500000;

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        MEM_SLEEP_ON_AC = "s2idle";
        MEM_SLEEP_ON_BAT = "deep";

        SOUND_POWER_SAVE_ON_AC = 1;
        SOUND_POWER_SAVE_ON_BAT = 1;

        DISK_APM_LEVEL_ON_AC = "254 254";
        DISK_APM_LEVEL_ON_BAT = "128 128";

        INTEL_GPU_MIN_FREQ_ON_AC = 0;
        INTEL_GPU_MIN_FREQ_ON_BAT = 0;
        INTEL_GPU_MAX_FREQ_ON_AC = 0;
        INTEL_GPU_MAX_FREQ_ON_BAT = 0;
        INTEL_GPU_BOOST_FREQ_ON_AC = 0;
        INTEL_GPU_BOOST_FREQ_ON_BAT = 0;

        RADEON_DPM_PERF_LEVEL_ON_AC = "high";
        RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";
        RADEON_DPM_STATE_ON_AC = "performance";
        RADEON_DPM_STATE_ON_BAT = "battery";
        RADEON_POWER_PROFILE_ON_AC = "high";
        RADEON_POWER_PROFILE_ON_BAT = "low";

        AMDGPU_ABM_LEVEL_ON_AC = 0;
        AMDGPU_ABM_LEVEL_ON_BAT = 3;

        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
      };
    };

    tumbler.enable = true;
    gvfs.enable = true;
    redshift = {
      enable = true;
      executable = "/bin/redshift-gtk";
      brightness = {
        day = "1";
        night = "1";
      };
      temperature = {
        day = 5700;
        night = 1600;
      };
    };
    displayManager = {
      defaultSession = "none+awesome";
    };
    blueman.enable = false;
    printing = {
      enable = true;
      drivers = [ pkgs.cnijfilter2 pkgs.gutenprint pkgs.hplipWithPlugin ];
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
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

