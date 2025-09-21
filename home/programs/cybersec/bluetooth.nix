# Bluetooth tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    bluez
    bluewalker
    python3Packages.bleak
    redfang
    ubertooth
  ];
}
