{
  imports = [
    ./amnezia.nix
  ];

  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  #  networking.extraHosts = ''
  #
  #  '';

  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };

    resolved.enable = true;
  };
}
