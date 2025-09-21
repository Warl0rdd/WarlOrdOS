# Tools for informtion gathering
{pkgs, ...}: {
  home.packages = with pkgs; [
    cloudbrute
    enumerepo
    holehe
    maigret
    metabigor
    # p0f
    sn0int
    socialscan
    theharvester
    urlhunter
  ];
}
