mkNixosModules: {
  imports = mkNixosModules [
   "hardware/amd.nix"
   "programs/obs-studio.nix"
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
    cores = 8;
    max-jobs = cores * 1;
  };

  services = {
    fstrim.enable = true;
  };
}
