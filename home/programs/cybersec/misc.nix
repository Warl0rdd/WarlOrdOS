# Various tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    ares-rs
    badchars
    changetower
    creds
    cve-prioritizer
    doona
    exposor
    galleta
    honeytrap
    jwt-cli
    kepler
    nmap-formatter
    penelope
    pwntools
    snscrape
    sr2t
    sttr
    troubadix
    wordlists
  ];
}
