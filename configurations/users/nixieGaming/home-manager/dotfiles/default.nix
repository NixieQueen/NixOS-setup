{ config, lib, pkgs, ... }:

{
  home.file.".config" = {
    recursive = true;
    source = ./dot-config;
  };
  home.file.".p10k.zsh" = {
    recursive = true;
    source = ./home-folder/.p10k.zsh;
  };
  home.file.".Xresources" = {
    text = ''
      Xft.dpi: 96
      Xcursor.theme: Numix-cursors
      Xcursor.size: 24
    '';
  };

  home.file.".config/hyfetch.json" = {
    text = ''
{
    "preset": "transgender",
    "mode": "rgb",
    "light_dark": "dark",
    "lightness": 0.65,
    "color_align": {
        "mode": "horizontal",
        "custom_colors": [],
        "fore_back": null
    },
    "backend": "neofetch",
    "args": null,
    "distro": null,
    "pride_month_shown": [],
    "pride_month_disable": false
}
    '';
  };

}
