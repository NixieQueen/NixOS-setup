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

  # Set up LACT for overclock/powerdraw changes
  environment.systemPackages = with pkgs; [ lact clinfo amdgpu_top ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
  #services.lact.enable = true;
}
