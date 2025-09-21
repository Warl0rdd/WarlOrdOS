# Common network tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    arp-scan
    arp-scan-rs
    arping
    arpoison
    atftp
    bandwhich
    bngblaster
    cdncheck
    evillimiter
    iperf2
    iputils
    lftp
    mdns-scanner
    mtr
    ncftp
    netcat-gnu
    netdiscover
    netexec
    nload
    nuttcp
    openvpn
    putty
    pwnat
    responder
    route-graph
    rustcat
    sshping
    sslh
    tunnelgraf
    wbox
    whois
    yersinia
  ];
}
