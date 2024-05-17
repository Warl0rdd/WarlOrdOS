let
  desktop = [
    ./core

    ./hardware

    ./network

    ./nix

    ./programs

    ./services
  ];

  laptop = desktop ++ [
    ./hardware/bluetooth.nix

    ./services/backlight.nix
    ./services/power.nix
  ];
in {
  inherit desktop laptop;
}
