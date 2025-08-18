{ config, pkgs, ... }:

{
    programs.thunar = {
        enable = true;
        plugins = with pkgs.xfce; [
            thunar-archive-plugin
            thunar-volman
        ];
    };

    services.tumbler.enable = true;
    services.gvfs.enable = true;

    # Enable archiving service
    programs.file-roller = {
        enable = true;
    };
}
