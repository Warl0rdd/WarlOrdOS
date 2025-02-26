mkHmModules: {inputs, ...}: {
  imports = mkHmModules [
    "terminal"
  ];

  theme = {
    flavor = "mocha";
    accent = "lavender";

    wallpaper = "${inputs.assets}/wallpapers/Frieren.jpg";
  };
}
