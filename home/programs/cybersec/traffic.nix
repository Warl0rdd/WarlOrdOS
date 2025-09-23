# Tools to capture network traffic
{pkgs, ...}: {
  home.packages = with pkgs; [
    above
    dhcpdump
    dnstop
    driftnet
    # dsniff
    goreplay
    joincap
    # junkie
    netsniff-ng
    ngrep
    secrets-extractor
    sniffglue
    tcpdump
    tcpflow
    tcpreplay
    termshark
    wireshark
    zeek
  ];
}
