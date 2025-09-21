# Container analysing tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    cdk-go
    clair
    cliam
    cloudlist
    dive
    dockle
    fwanalyzer
    grype
    trivy
  ];
}
