{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "NixieQueen";
      userEmail = "thestampyliker@gmail.com";
      extraConfig = {
        credential = {
          helper = "libsecret";
          credentialStore = "cache";
        };
      };
    };
  };
}
