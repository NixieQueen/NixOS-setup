<<<<<<< HEAD
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #lammps
    #iqmol
=======
{ pkgs }:

{
  home.packages = with pkgs; [
    lammps
>>>>>>> f4fc22d (Setup: lammps-gui)
  ];
}
