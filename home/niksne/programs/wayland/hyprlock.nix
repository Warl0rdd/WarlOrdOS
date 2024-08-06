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
          color = theme.hex.base;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:5000] fish -c fetch_battery";
          color = theme.hex.${config.theme.accent};
          font_size = 25;
          inherit font_family;
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
        {
          monitor = "";
          text = "$TIME";
          color = theme.hex.text;
          font_size = 90;
          inherit font_family;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = theme.hex.text;
          font_size = 25;
          inherit font_family;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:1000] fish -c fetch_music_player_data";
          color = theme.hex.text;
          font_size = 18;
          inherit font_family;
          position = "0, 40";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = "$LAYOUT[ENG,RUS]";
          text_align = "center";
          color = theme.hex.text;
          font_size = 18;
          inherit font_family;
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
      ];

      image = [
        {
          monitor = "";
          path = "${config.home.homeDirectory}/.face";
          size = 100;
          border_color = theme.hex.${config.theme.accent};

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
          outer_color = theme.hex.${config.theme.accent};
          inner_color = theme.hex.surface0;
          font_color = theme.hex.text;
          fade_on_empty = false;
          placeholder_text = "<span foreground=\"#${theme.palette.text}\"><i>󰌾 Logged in as </i><span foreground=\"#${theme.palette.${config.theme.accent}}\">$USER</span></span>";
          check_color = theme.hex.${config.theme.accent};  
          fail_color = theme.hex.red;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = theme.hex.yellow;
          position = "0, -50";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
