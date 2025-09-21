# Load testing tools
{pkgs, ...}: {
  home.packages = with pkgs; [
    ali
    drill
    cassowary
    ddosify
    oha
    siege
    tsung
    vegeta
  ];
}
