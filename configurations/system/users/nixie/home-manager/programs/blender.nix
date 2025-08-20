{ config, lib, pkgs, computerType, ... }:

{
  home.packages = with pkgs; lib.mkMerge [
    (lib.optionals (computerType == "desktop") [blender-hip])
    (lib.optionals (computerType == "laptop") [blender])
  ];
}
