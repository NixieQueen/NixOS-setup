{ config, pkgs, ... }:

{
  # Make xserver use the correct driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  # Get OpenCL&OpenGL support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  environment.systemPackages = with pkgs; [
    clinfo
  ];
}
