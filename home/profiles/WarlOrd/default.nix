mkHmModules: {inputs, ...}: {
  imports = mkHmModules [
    "terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "lavender";

    wallpaper = "~/Wallpapers/wallpaper.jpg";
  };
}
