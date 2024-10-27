{ config, lib, pkgs, ... }:

{
  services.xserver = {
    windowManager = {
      awesome = {
        enable = true;
        package = pkgs.awesome-git;
        luaModules = with pkgs.luaPackages; [
          luarocks
        ];
      };
    };
  };
  home.file.".config/awesome" = {
    source = builtins.fetchGit {
      url = "https://github.com/NixieQueen/awesomeWM-setup.git";
      rev = "6ed2696b2fa1dca76a9ae847d44de064c03afb13";
      #allRefs = true;
    };
  };
}
