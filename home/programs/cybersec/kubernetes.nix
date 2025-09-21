# Kubernetes infrastructure
{pkgs, ...}: {
  home.packages = with pkgs; [
    cfripper
    checkov
    cirrusgo
    kdigger
    kube-hunter
    kube-score
    kubeaudit
    kubestroyer
    kubescape
    popeye
  ];
}
