{ config, lib, pkgs, ... }:

{
  time.timeZone = "Europe/Amsterdam";

   # Use the GRUB boot loader.
  #boot.kernelPackages = pkgs.linuxPackages_zen;
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;  #  CRASHES!!!
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x10"
  ];

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
      GDK_SCALE = "1";
      GDK_DPI_SCALE = "1";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=1";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      emacs = "doom run";
    };
  };
}
