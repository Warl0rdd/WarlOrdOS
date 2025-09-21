# Port scanners
{pkgs, ...}: {
  home.packages = with pkgs; [
    das
    havn
    ipscan
    masscan
    naabu
    nmap
    udpx
    smap
    sx-go
    rustscan
    zmap
  ];
}
