{niksos, ...}: {
  flake.nixosConfigurations = with niksos.hosts;
    mkHosts {
      laptop-WarlOrd = systemProfiles.laptop;
    };
}
