{ config, pkgs, ... }:

{
  imports = [ ./audio.nix ./openconnect.nix ./printing.nix ./samba.nix ];
}
