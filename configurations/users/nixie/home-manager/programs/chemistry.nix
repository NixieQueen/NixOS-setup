{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #lammps
    #iqmol
  ];
}
