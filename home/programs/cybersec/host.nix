# Host security tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    linux-exploit-suggester
    lynis
    safety-cli
    tracee
    vulnix
  ];
}
