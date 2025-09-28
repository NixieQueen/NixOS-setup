{ config, pkgs, inputs, ... }:
let
  #pkgs-hyprland-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  # Make xserver use the correct driver
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable HIP
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

  # Get OpenCL&OpenGL support
  hardware.graphics = {
    #package = pkgs-hyprland-unstable.mesa;
    #package32 = pkgs-hyprland-unstable.pkgsi686Linux.mesa;
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
