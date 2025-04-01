{ config, pkgs, lib, ... }:

{
  #xdg.userDirs = {
  #  enable = true;
  #  createDirectories = true;
  #};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixiegaming = {
    isNormalUser = true;
    extraGroups = [ "video" "audio" "networkmanager" ]; # Enable ‘sudo’ for the user.
    initialPassword = "nixiegaming";
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

}
