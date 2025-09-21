# Host security tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    checksec
    chkrootkit
    linux-exploit-suggester
    lynis
    safety-cli
    tracee
    vulnix
  ];
}
