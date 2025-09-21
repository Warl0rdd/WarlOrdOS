# Microsoft infrastructure and Windows-related tools, incl. SMB
{pkgs, ...}: {
  home.packages = with pkgs; [
    adidnsdump
    adreaper
    autobloody
    azurehound
    bloodhound-py
    breads-ad
    chainsaw
    certi
    certipy
    certsync
    coercer
    donpapi
    enum4linux
    enum4linux-ng
    erosmb
    # evil-winrm
    go365
    gomapenum
    kerbrute
    knowsmore
    lil-pwny
    nbtscan
    nbtscanner
    offensive-azure
    pre2k
    rdwatool
    samba
    sccmhunter
    smbmap
    smbscan
  ];
}
