{ config, pkgs, ... }:

{
  programs = {
    librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.cookies" = true;
      };
    };
  };
}
