{ config, pkgs, ... }:

{
  # Make xserver use the correct driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  # Get OpenCL support
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
  environment.systemPackages = with pkgs; [
    clinfo
  ];
  hardware.graphics.enable32Bit = true;
}
