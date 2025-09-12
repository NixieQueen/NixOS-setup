{ pkgs, ... }:

{
  # Use the GRUB boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;  #  CRASHES!!!
  #boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x200"
    "amdgpu.sg_display=0"  # Might fix flashing on second monitor?
    "amdgpu.ppfeaturemask=0xffffffff"
    "pcie_aspm=off"
    "amdgpu.aspm=0"
   ];
}
