{niksos, ...}: {
  flake.nixosConfigurations = with niksos.hosts;
    mkHosts {
      table-niksne = systemProfiles.desktop;
      laptop-WarlOrd = systemProfiles.laptop;
      niksos-wsl = systemProfiles.minimal;
    };
}
