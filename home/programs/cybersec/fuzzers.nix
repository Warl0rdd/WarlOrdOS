# Fuzzing tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    aflplusplus
    feroxbuster
    ffuf
    gobuster
    honggfuzz
    radamsa
    regexploit
    scout
    ssdeep
    wfuzz
    zzuf
  ];
}
