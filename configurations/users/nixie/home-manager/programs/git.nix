{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "NixieQueen";
      userEmail = "thestampyliker@gmail.com";
      package = pkgs.git.override { withLibsecret = true; };
      extraConfig = {
        gpg.format = "ssh";
        credential.helper = "libsecret";
      };
    };
  };
}
