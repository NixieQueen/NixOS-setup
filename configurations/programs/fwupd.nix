{ config, pkgs, ... }:
# For updating framework bios
{
    services.fwupd.enable = true;
}
