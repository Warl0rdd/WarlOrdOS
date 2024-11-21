{lib, ...}: let
  substituters = {
    "cache.nixos.org?priority=10" = "6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=";

    "hyprland.cachix.org" = "a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=";
    "nix-community.cachix.org" = "mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
    "wezterm.cachix.org" = "kAbhjYUC9qvblTE+s7S+kl5XM1zVa4skO+E/1IDWdH0=";
  };
in {
  nix.settings = {
    substituters = lib.pipe substituters [
      builtins.attrNames
      (map (s: "https://${s}"))
    ];
    trusted-public-keys = lib.pipe substituters [
      (
        builtins.mapAttrs (s_: k: let
          s = lib.pipe s_ [
            (builtins.split "\\?")
            builtins.head
          ];
        in "${s}-1:${k}")
      )
      builtins.attrValues
    ];
  };
}
