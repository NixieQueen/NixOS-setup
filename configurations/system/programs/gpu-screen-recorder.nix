{ ... }:

{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "com.dec05eba.gpu_screen_recorder"
    ];
  };
}
