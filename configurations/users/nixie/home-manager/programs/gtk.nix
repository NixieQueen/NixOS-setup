{ config, pkgs, ... }:

let
  package_url = "	https://files06.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2ODAzMDk3NzkiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjI0MzM0ODY2ODE3MzdkMjQ5OGY0YmY4YjNjZGMwOGZhYzY4N2Y2MGMwNzAyMDJmYWVlMmRhZDY5M2M0MTkxMTM1ZGExNWVlNDY5ODcyM2U0ZDIxOTFiY2FmY2E2YWI4Y2UzZmVlMTdiZTI1ZmY3NzIxZTI5MzVlNGU2YTBjZjRmIiwidCI6MTc1OTkzMjgyNywic3RmcCI6Im51bGwiLCJzdGlwIjoiMjAwMToxYzAwOjcxYjo2MDAwOmU4ZmM6YWUxMzplNmM2OjY3N2QifQ.Ty24kL_dEdXd2p9CLJQeYwG-LpNLHIbiYc9xuu7HWp0/Skyrim-by-ru5tyshark-cursors.tar.bz2";
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "skyrim";
    package =
      pkgs.runCommand "moveUp" {} ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.fetchzip {
          url = package_url;
          hash = "sha256-/+tjX9oR5+vxSL/tWFupftsmEBTNzwdj2uu0CJKiZuo=";
        }} $out/share/icons/skyrim
      '';
    size = 48;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    # cursorTheme = {
    #   name = "skyrim";
    #   package = pkgs.skyrim-cursor-theme;
    #   size = 48;
    # };
    

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  home.sessionVariables.GTK_THEME = "palenight";
  home.sessionVariables.GTK_ICON_THEME = "Papirus-Dark";
}
