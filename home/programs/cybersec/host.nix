# Host security tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    checksec
    linux-exploit-suggester
    lynis
    safety-cli
    tracee
    vulnix
  ];
}
