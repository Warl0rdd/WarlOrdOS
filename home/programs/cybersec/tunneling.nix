# Tunneling tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    bore-cli
    corkscrew
    hans
    chisel
    httptunnel
    iodine
    sish
    sshuttle
    stunnel
    udptunnel
    wstunnel
  ];
}
