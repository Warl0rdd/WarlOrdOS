{
  config,
  inputs,
  pkgs,
  theme,
  ...
}: let
  font_family = "JetBrainsMono Nerd Font";
in  {
  programs.hyprlock = {
    enable = true;
    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {

      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = config.theme.wallpaper;
          blur_passes = 0;
          color = theme.hex.palette.base;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:5000] fish -c fetch_battery";
          color = theme.hex.accent;
          font_size = 25;
          inherit font_family;
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:30000] date +\"%R\"";
          color = theme.hex.palette.text;
          font_size = 90;
          inherit font_family;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:1000] fish -c fetch_music_player_data";
          color = theme.hex.palette.text;
          font_size = 18;
          inherit font_family;
          position = "0, -40";
          halign = "center";
          valign = "bottom";
        }
      ];

      image = [
        {
          monitor = "";
          path = "${config.home.homeDirectory}/.face";
          size = 100;
          border_color = theme.hex.accent;

          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = theme.hex.accent;
          inner_color = theme.hex.palette.surface0;
          font_color = theme.hex.palette.text;
          fade_on_empty = false;
          placeholder_text = "<span foreground=\"#${theme.palette.text}\"><i>󰌾 Logged in as </i><span foreground=\"#${theme.accent}\">$USER</span></span>";
          check_color = theme.hex.accent;  
          fail_color = theme.hex.palette.red;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = theme.hex.palette.yellow;
          position = "0, -50";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
