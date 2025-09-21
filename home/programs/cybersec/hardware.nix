# Tools and libraries to access hardware
{pkgs, ...}: {
  home.packages = with pkgs; [
    cantoolz
    chipsec
    cmospwd
    esptool
    extrude
    gallia
    hachoir
    nrfutil
    packetry
    teensy-loader-cli
    termineter
    tytools
    # routersploit
  ];
}
