{ config, pkgs, ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      TLP_ENABLE = 1;

      CPU_DRIVER_OPMODE_ON_AC = "passive";
      CPU_DRIVER_OPMODE_ON_BAT = "passive";

      # Valid options: powersave performance schedutil
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
      # Valid options: performance balance_performance default balance_power power
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      TLP_DEFAULT_MODE = "AC";
      TLP_PERSISTENT_DEFAULT=0;

      CPU_SCALING_MIN_FREQ_ON_AC = 800000;
      CPU_SCALING_MAX_FREQ_ON_AC = 5000000;
      CPU_SCALING_MIN_FREQ_ON_BAT = 800000;
      CPU_SCALING_MAX_FREQ_ON_BAT = 2000000;

      # Requires Intel
      CPU_HWP_DYN_BOOST_ON_AC=1;
      CPU_HWP_DYN_BOOST_ON_BAT=0;

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 30;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;

      # Valid options: performance balanced low-power
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      MEM_SLEEP_ON_AC = "s2idle";
      MEM_SLEEP_ON_BAT = "deep";

      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 10;  # 10 for pipewire, 1 for pulseaudio

      DISK_APM_LEVEL_ON_AC = "254 254";
      DISK_APM_LEVEL_ON_BAT = "128 128";

      INTEL_GPU_MIN_FREQ_ON_AC = 0;
      INTEL_GPU_MIN_FREQ_ON_BAT = 0;
      INTEL_GPU_MAX_FREQ_ON_AC = 0;
      INTEL_GPU_MAX_FREQ_ON_BAT = 0;
      INTEL_GPU_BOOST_FREQ_ON_AC = 0;
      INTEL_GPU_BOOST_FREQ_ON_BAT = 0;

      RADEON_DPM_PERF_LEVEL_ON_AC = "high";     # Needs amdgpu
      RADEON_DPM_PERF_LEVEL_ON_BAT = "auto";    # Needs amdgpu
      RADEON_DPM_STATE_ON_AC = "performance";
      RADEON_DPM_STATE_ON_BAT = "battery";
      RADEON_POWER_PROFILE_ON_AC = "high";
      RADEON_POWER_PROFILE_ON_BAT = "low";

      AMDGPU_ABM_LEVEL_ON_AC = 0;
      AMDGPU_ABM_LEVEL_ON_BAT = 3;

      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "off";

      START_CHARGE_THRESH_BAT0 = 0;
      STOP_CHARGE_THRESH_BAT0 = 100;

      PCIE_ASPM_ON_AC = "performance";
      PCIE_ASPM_ON_BAT = "powersupersave";
      RUNTIME_PM_ON_AC = 0;
      RUNTIME_PM_ON_BAT = 1;
    };
  };
}
