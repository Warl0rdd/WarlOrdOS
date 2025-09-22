# Tools to work with cloud environments
{pkgs, ...}: {
  home.packages = with pkgs; [
    cloud-nuke
    cloudfox
    ec2stepshell
    gato
    gcp-scanner
    # ggshield
    goblob
    grimoire
    imdshift
    pacu
    # poutine
    prowler
    yatas
  ];
}
