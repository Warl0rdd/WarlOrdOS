# Password and hashing tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    authoscope
    bruteforce-luks
    brutespray
    conpass
    crunch
    h8mail
    hashcat
    hashcat-utils
    hashdeep
    john
    legba
    medusa
    nasty
    ncrack
    nth
    phrasendrescher
    thc-hydra
    truecrack
  ];
}
