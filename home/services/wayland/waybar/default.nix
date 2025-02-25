{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = inputs.waybar.packages.${pkgs.system}.waybar;
    settings = [
      {
        name = "top_bar";
        layer = "top";
        position = "top";
        height = 46;
        spacing = 4;
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock#time"
          "custom/separator"
          "clock#week"
          "custom/separator"
          "clock#calendar"
        ];
        modules-right = [
          "bluetooth"
          "network"
          "hyprland/language"
        ];
        "custom/launcher" = {
          format = " ";
          on-click = "rofi -show drun";
          on-click-right = "wlogout";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format = "{icon}";
          format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            "6" = "󰲪";
            "7" = "󰲬";
            "8" = "󰲮";
            "9" = "󰲰";
            "10" = "󰿬";
            "11" = "";
            "12" = "";
            "13" = "";
            "14" = "";
            "15" = "󰙯";
            "16" = "";
            "17" = "";
            "18" = "";
            "19" = "󰕃";
            "20" = "󰆧";
            "21" = "󰍳";
            "22" = "";
          };
        };
        "clock#time" = {
          interval = 1;
          format = "{:%H:%M:%S}";
        };
        "custom/separator" = {
          format = "|";
        };
        "clock#week" = {
          format = "{:%a}";
          locale = "en_US.UTF-8";
        };
        "clock#calendar" = {
          format = "{:%d-%m-%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = with config.theme.colors; {
              months = "<span color='#${rosewater}'><b>{}</b></span>";
              days = "<span color='#${text}'><b>{}</b></span>";
              weeks = "<span color='#${mauve}'><b>W{}</b></span>";
              weekdays = "<span color='#${green}'><b>{}</b></span>";
              today = "<span color='#${teal}'><b><u>{}</u></b></span>";
            };
          };
        };
        bluetooth = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱 {device_alias}";
          format-connected-battery = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
          tooltip-format = ''            {controller_alias}\t{controller_address} ({status})

            {num_connections} connected'';
          tooltip-format-disabled = "bluetooth off";
          tooltip-format-connected = ''            {controller_alias}\t{controller_address} ({status})

            {num_connections} connected\n\n{device_enumerate}'';
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t({device_battery_percentage}%)";
          max-length = 35;
          on-click = "fish -c toggle_bluetooth";
          on-click-right = "blueman-manager";
        };
        network = {
          interval = 1;
          format = "󰤭";
          format-wifi = "{icon} ({signalStrength}%){essid}";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-disconnected = "󰤫  Disconnected";
          tooltip-format = "wifi <span color='#${config.theme.colors.maroon}'>off</span>";
          tooltip-format-wifi = with config.theme.colors; ''
            SSID = {essid}({signalStrength}%), {frequency} MHz
            Interface = {ifname}
            IP = {ipaddr}
            GW = {gwaddr}

            <span color='#${green}'>{bandwidthUpBits}</span>\t<span color='#${maroon}'>{bandwidthDownBits}</span>\t<span color='#${mauve}'>󰹹{bandwidthTotalBits}</span>
          '';
          tooltip-format-disconnected = "<span color='#${config.theme.colors.red}'>disconnected</span>";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-linked = "󰈀 {ifname} (No IP)";
          tooltip-format-ethernet = with config.theme.colors; ''            Interface = {ifname}
            IP = {ipaddr}
            GW = {gwaddr}
            Netmask = {netmask}
            CIDR = {cidr}

            <span color='#${green}'>{bandwidthUpBits}</span> <span color='#${maroon}'>{bandwidthDownBits}</span> <span color='#${mauve}'>󰹹{bandwidthTotalBits}</span>'';
          max-length = 35;
          on-click = "fish -c toggle_wifi";
          on-click-right = "nm-connection-editor";
        };
        "hyprland/language" = {
          format-en = "ENG";
          format-ru = "RUS";
          on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next";
          on-click-right = "hyprctl switchxkblayout at-translated-set-2-keyboard prev";
        };
      }
      {
        name = "bottom_bar";
        layer = "top";
        position = "bottom";
        height = 36;
        spacing = 4;
        modules-left = [
          "user"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/weather"
          "custom/media"
        ];
        user = {
          format = with config.theme.colors; "<span color='#${accent}'> {user}</span> (up <span color='#${pink}'>{work_d} d</span> <span color='#${blue}'>{work_H} h</span> <span color='#${red}'>{work_M} min</span> <span color='#${green}'>↑</span>)";
          icon = true;
        };
        "hyprland/window" = {
          format = "{title} ({class})";
          max-length = 75;
          separate-outputs = true;
        };
        "custom/weather" = {
          format = "{}°";
          interval = 600;
          exec = "${lib.getExe pkgs.wttrbar} --date-format \"%d-%m-%Y\"";
          exec-if = "fish -c check_streamer_mode";
          return-type = "json";
        };
        "custom/media" = {
          format = "{icon}  {}";
          restart-interval = 2;
          return-type = "json";
          format-icons = {
            "Playing" = "";
            "Paused" = "";
          };
          max-length = 40;
          exec = "fish -c \"fetch_music_player_data -w\"";
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
          on-click-middle = "playerctl prev";
          on-scroll-up = "playerctl volume 0.05+";
          on-scroll-down = "playerctl volume 0.05-";
          smooth-scrolling-threshold = "0.1";
          reverse-scrolling = true;
        };
      }
      {
        name = "left_bar";
        layer = "top";
        position = "left";
        spacing = 4;
        width = 60;
        margin-top = 9;
        margin-bottom = 9;
        modules-left = [
          "wlr/taskbar"
        ];
        modules-center = [
          "cpu"
          "memory"
          "disk"
          "temperature"
          "battery"
          "backlight"
          "pulseaudio#output"
          "pulseaudio#input"
        ];
        modules-right = [
          "group/misc"
          "tray"
        ];
        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 20;
          icon-theme = "Numix-Circle";
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-right = "close";
          on-click-middle = "fullscreen";
        };
        cpu = {
          interval = 1;
          format = "󰻠 {usage}%";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "mission-center";
        };
        memory = {
          interval = 1;
          format = " {percentage}%";
          tooltip-format = ''            Main: ({used} GiB/{total} GiB)({percentage}%,) available {avail} GiB
            Swap: ({swapUsed} GiB/{swapTotal} GiB)({swapPercentage}%), available {swapAvail} GiB'';
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "mission-center";
        };
        disk = {
          format = "󰋊 {percentage_used}%";
          tooltip-format = "({used}/{total})({percentage_used}%) in '{path}', available {free}({percentage_free}%)";
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          on-click = "mission-center";
        };
        temperature =
          {
            interval = 1;
            tooltip = false;
            critical-threshold = 90;
            format = "{icon} {temperatureC}󰔄";
            # "format-critical" = "🔥{icon} {temperatureC}󰔄";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          }
          // (
            if config.home.host == "laptop-WarlOrd"
            then {
              hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input";
            }
            else {}
          );
        battery = {
          interval = 1;
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-time = "{H} h {M} min";
          format-icons = [
            "󱃍"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          tooltip-format = "{timeTo}";
        };
        backlight = {
          reverse-scrolling = true;
          format = "{icon} {percent}%";
          format-icons = [
            "󰌶"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
          tooltip = false;
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
        };
        "pulseaudio#output" = {
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          tooltip-format = "{desc}";
          format = "{icon} {volume}%";
          format-bluetooth = "󰂱{icon} {volume}%";
          format-bluetooth-muted = "󰂱󰝟 {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = {
            headphone = "󰋋";
            hands-free = "";
            headset = "󰋎";
            phone = "󰄜";
            portable = "󰦧";
            car = "󰄋";
            speaker = "󰓃";
            hdmi = "󰡁";
            hifi = "󰋌";
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
          on-click = "pamixer -t";
          on-click-right = "pypr toggle volume";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          reverse-scrolling = true;
          scroll-step = 1;
        };
        "pulseaudio#input" = {
          states = {
            high = 90;
            upper-medium = 70;
            medium = 50;
            lower-medium = 30;
            low = 10;
          };
          tooltip-format = "{desc}";
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 {volume}%";
          on-click = "pamixer --default-source -t";
          on-click-right = "pypr toggle volume";
          on-scroll-up = "pamixer --default-source -i 1";
          on-scroll-down = "pamixer --default-source -d 1";
          reverse-scrolling = true;
          scroll-step = 1;
        };
        "group/misc" = {
          orientation = "vertical";
          modules = [
            "pulseaudio#microphone_indicator"
            "custom/recording"
            # "custom/github";
            "custom/streamer_mode"
            "custom/notifications"
            "custom/night_mode"
            "custom/airplane_mode"
            "idle_inhibitor"
          ];
        };
        "pulseaudio#microphone_indicator" = {
          format = "{format_source}";
          format-source = "󰍬";
          format-source-muted = "";
          tooltip-format = "microphone on";
        };
        "custom/recording" = {
          interval = 1;
          exec-if = "pgrep wf-recorder";
          exec = "fish -c check_recording";
          return-type = "json";
        };
        "custom/github" = {
          format = "  {}";
          return-type = "json";
          interval = 1;
          exec = "~/.config/waybar/scripts/github.sh";
          on-click = "xdg-open https://github.com/notifications";
        };
        "custom/streamer_mode" = {
          interval = 1;
          return-type = "json";
          exec = "fish -c \"check_streamer_mode -w\"";
          on-click = "fish -c toggle_streamer_mode && fish -c reload_bar";
        };
        "custom/notifications" = {
          return-type = "json";
          exec = "fish -c notifications";
          on-click = "swaync-client -t";
          on-click-middle = "swaync-client -C";
          on-click-right = "swaync-client -d";
          restart-interval = 1;
        };
        "custom/night_mode" = {
          return-type = "json";
          interval = 1;
          exec = "fish -c check_night_mode";
          on-click = "fish -c toggle_night_mode";
        };
        "custom/airplane_mode" = {
          return-type = "json";
          interval = 1;
          exec = "fish -c check_airplane_mode";
          on-click = "fish -c toggle_airplane_mode";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰛐";
            deactivated = "󰛑";
          };
          tooltip-format-activated = "idle-inhibitor <span color='#${config.theme.colors.green}'>on</span>";
          tooltip-format-deactivated = "idle-inhibitor <span color='#${config.theme.colors.maroon}'>off</span>";
          start-activated = true;
        };
        tray = {
          icon-size = 20;
          spacing = 2;
        };
      }
    ];
    style = ''
      @define-color accent @${config.theme.accent};

      ${builtins.readFile ./style.css}
    '';
  };
}
