{ lib, config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    fira-sans
    kode-mono
    corefonts
  ];
}
