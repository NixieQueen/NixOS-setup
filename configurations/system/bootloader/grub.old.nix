{ config, lib, pkgs, ... }:

{
  boot.loader = {
	  grub = {
		  enable = true;
		  efiSupport = true;
      useOSProber = true;
      #theme = grubThemes.bigsur-grub2-theme;
      theme = "${
        (pkgs.fetchFromGitHub {
          owner = "jacksaur";
          repo = "CRT-Amber-GRUB-Theme";
          rev = "91c376037d6fe2eb62b82cb5f7b5148438c8ed77";
          sha256 = "";
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
}
