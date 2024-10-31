{ config, lib, pkgs, ... }:

{
  # Allow unfree stuffs, required for printer
  nixpkgs = {
    config.allowUnfree = true;
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
       automatic = true;
       dates = "weekly";
       options = "--delete-older-than 7d";
    };
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";
  };

  time.timeZone = "Europe/Amsterdam";

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

  environment = {
    shells = with pkgs; [ zsh ];

    sessionVariables = {
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
      NIXOS_OZONE_WL = "1";
      emacs = "doom run";
    };
  };




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
