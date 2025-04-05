{ config, pkgs, ... }:

{
  imports = [ ./audio.nix ./printing.nix ./samba.nix ];
}
