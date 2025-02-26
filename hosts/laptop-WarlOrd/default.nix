mkNixosModules: {
  imports = (mkNixosModules [
   "core"
#    "hardware/amd.nix"
#    "programs/obs-studio.nix"
  ]) ++ [
  ./disks
  ./hardware-configuration.nix
  ];

  boot.loader = {
    grub = {
      efiSupport = true;
      device = "nodev";
    };
    efi.canTouchEfiVariables = true;
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };

  nix.settings = rec {
    cores = 1;
    max-jobs = cores * 1;
  };

  services = {
    fstrim.enable = true;
  };
}
