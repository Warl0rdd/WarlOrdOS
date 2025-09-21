# Bluetooth tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    bluez
    bluewalker
    redfang
    ubertooth
  ];
}
