{pkgs, ...}: {
  imports = [
    ./discord.nix
  ];

  home.packages = with pkgs; [
    thunderbird
    telegram-desktop

    chatterino2
  ];
}
