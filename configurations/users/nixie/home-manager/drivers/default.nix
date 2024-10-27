{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        dconf
        python39
        ripgrep
        dex
    ];
}
