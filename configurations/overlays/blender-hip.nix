{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      blender = prev.blender-hip;
    })
  ];
}
