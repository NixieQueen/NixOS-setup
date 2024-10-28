{ useWayland ? false, ... }:

{
  import = if useWayland then
    ./X11.nix
  else
    ./Wayland.nix;
}
