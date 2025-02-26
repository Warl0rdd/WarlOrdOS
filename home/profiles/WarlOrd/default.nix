mkHmModules: {inputs, ...}: {
  imports = mkHmModules [
    "terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "lavender";

    wallpaper = "/home/WarlOrd/wallpapers/wolfclan.png";
  };
}
