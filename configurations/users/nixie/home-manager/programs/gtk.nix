{ config, pkgs, ... }:

let
  package_url = "	https://files06.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2ODAzMDk3NzkiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjM4YmQyZTA3NTM1NjM3NjlmOGMzZjE2Y2E0YmQyYzg3Yjc2MDA2YTVhMWMwMGU2ZmY5OTY2NTJjNzYxMDg0OTNlZDA1NzA2NmEzM2RiYzk4OTQyYzg1YzQ1ZTBkNGFkYTc4MzgyYTQ1NGQ5OGVlYjk0ZGYyMzUyODRkNTU2MjVlIiwidCI6MTc2MjQ2OTU1Niwic3RmcCI6Im51bGwiLCJzdGlwIjoiMTg4Ljk1LjM0LjQ4In0.POCmWsbwVEktrrYSq7tgsYD5gvQcvkWExG_kyRkNhao/Skyrim-by-ru5tyshark-cursors.tar.bz2";
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
