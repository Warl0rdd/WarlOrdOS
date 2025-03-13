{pkgs, ...}: {
  users.users = {
    WarlOrd = {
      isNormalUser = true;
      description = "WarlOrd";
      shell = pkgs.fish;
      extraGroups = [
        "input"
        "networkmanager"
        "video"
        "wheel"
      ];
    };
  };
}
