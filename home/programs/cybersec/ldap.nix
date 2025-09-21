# LDAP/AD tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    adenum
    hekatomb
    msldapdump
    ldapmonitor
    ldapdomaindump
    ldapnomnom
    ldeep
    silenthound
  ];
}
