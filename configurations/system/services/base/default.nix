{ config, pkgs, ... }:

{
  imports = [ ./audio.nix ./openconnect.nix ./kde-connect.nix ./printing.nix ./samba.nix ./drawingtablet.nix ];
}
