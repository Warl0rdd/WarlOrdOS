{niksos, ...}: let
  inherit (niksos.homes) mkHomeImports mkHomes;

  users = {
    laptop-WarlOrd = ["WarlOrd"];
  };

  homeImports = mkHomeImports users;
in {
  _module.args = {inherit homeImports;};

  flake.homeConfigurations = mkHomes users;
}
