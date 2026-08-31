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
    environment.systemPackages = with pkgs; [
      file-roller
    ];
}
