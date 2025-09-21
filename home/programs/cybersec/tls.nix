# SSL/TLS testing tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    cero
    gsan
    sslscan
    ssldump
    sslsplit
    sslstrip
    testssl
    tlsinfo
    tlsx
  ];
}
