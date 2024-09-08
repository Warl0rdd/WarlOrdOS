{
  lib,
  pkgs,
  self,
  inputs,
  ...
}: let
  users = {
    table-niksne = [ "niksne" ];
    laptop-niksne = [ "niksne" ];
  };


  rawMk = nameValueFunction: hosts: builtins.listToAttrs (
    builtins.concatLists (lib.mapAttrsToList (
      host: users: builtins.map (user: nameValueFunction host user) users
    ) hosts)
  );

  homeImports = rawMk (
    host: user: lib.nameValuePair "${user}@${host}" [ 
      ./${user} 
      ./${user}/profiles/${host} 
    ]
  ) users;

  inherit (inputs.hm.lib) homeManagerConfiguration;
in {
  _module.args = { inherit homeImports; };

  flake.homeConfigurations = rawMk (host: user: lib.nameValuePair "${user}_${host}" (
    homeManagerConfiguration {
      modules = homeImports."${user}@${host}";
      extraSpecialArgs = { inherit inputs self; };
      inherit pkgs;
    }
  )) users;
}
