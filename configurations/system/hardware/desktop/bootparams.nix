{ pkgs, ... }:

{
  # Use the GRUB boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;  #  CRASHES!!!
  #boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    #"amdgpu.dcdebugmask=0x10"
  ];
}
