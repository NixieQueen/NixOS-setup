{ config, lib, pkgs, ... }:

{
  home.file.".config/autostart/discord.desktop" = {
    source = ./dot-config/autostart/discord.desktop;
  };
  home.file.".config/autostart/polkit.desktop" = {
    source = ./dot-config/autostart/polkit.desktop;
  };

  home.file.".config/btop" = {
    recursive = true;
    source = ./dot-config/btop;
  };
  home.file.".config/doom" = {
    recursive = true;
    source = ./dot-config/doom;
  };
  home.file.".config/kitty" = {
    recursive = true;
    source = ./dot-config/kitty;
  };
  home.file.".config/Thunar" = {
    recursive = true;
    source = ./dot-config/Thunar;
  };
  home.file.".config/patchbay" = {
    recursive = true;
    source = ./dot-config/patchbay;
  };
  home.file.".config/ckb-next" = {
    recursive = true;
    source = ./dot-config/ckb-next;
  };

  home.file.".p10k.zsh" = {
    source = ./dot-config/.p10k.zsh;
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

  home.file.".config/awesome" = {
    source = builtins.fetchGit {
      url = "https://github.com/NixieQueen/awesomeWM-setup.git";
      rev = "0730171a7bcd9bdfb85833b95e22bb861ce92594";
      #allRefs = true;
    };
  };
}
