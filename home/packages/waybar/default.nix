{ config, lib, pkgs, ...}:  {
  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
        border-radius: 3;
        font-family: "Poppins";
        font-size: 14px;
      }

      window#waybar {
        background: transparent;
        transition-property: background-color;
        transition-duration: 1s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      window#waybar.empty {
        background: none;
      }

      #waybar.empty #window {
        background: none;
      }

      tooltip {
        /*background: transparent;*/
        /*box-shadow: 2px 2px 2px black;*/
        border-width: 2px;
        border-color: #211f1f;
        color: white; 
        background-color: #36322f;
        font-family: Poppins;
        border-radius: 5px 5px 5px 5px;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px; 
      }

      #window {
        margin-top: 6px;
        padding-left: 20px;
        padding-right: 20px;
        border-radius: 8px;
        transition: none;
        background: #2e3440;
        color: #d8dee9;
      }

      #custom-powermenu {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        padding-left: 16px;
        padding-right: 20px;
        border-radius: 8px;
        font-size: 20px;
        transition: none;
        color: #fff;
        background:#88c0d0;
      }

      #mode {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        padding-left: 16px;
        padding-right: 20px;
        border-radius: 8px;
        transition: none;
        background: #2e3440;
      }

      #workspaces {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        padding-left: 16px;
        padding-right: 20px;
        border-radius: 8px;
        transition: none;
        background: #2e3440;
      }

      #workspaces button {
        transition: none;
        color: #4c566a;
        background: transparent;
        border-radius: 0px;
      }

      #workspaces button.occupied {
        transition: none;
        color: #a3be8c;
        background: transparent;
        font-size: 4px;
      }

      #workspaces button.focused {
        color: #81a1c1;
        border-bottom: 2px solid #81a1c1;
      }

      #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        color: #81a1c1;
      }

       #workspaces button.active {
        color: #81a1c1;
      }

      #temperature {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        /*margin-right: 12px;*/
        border-radius: 8px;
        transition: none;
        padding: 0 10px;
        color: #88c0d0;
        background: #2e3440;
      }

      #pulseaudio {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 0 10px;
        color: #a3be8c;
        background: #2e3440;
      }

      #battery {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        /* margin-right: 12px; */
        border-radius: 8px;
        transition: none;
        padding: 10px 10px;
        color: #a3be8c;
        background: #2e3440;
      }

      #battery.critical:not(.charging) {
        background-color: #d8dee9;
        color: #2e3440;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      @keyframes blink {
        to {
          background-color: #bf616a;
          color: #d8dee9;
        }
      }

      #backlight {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 10px 10px;
        color: #a3be8c;
        background: #2e3440;
      }

      #custom-wl-gammarelay-temperature {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 10px 10px;
        color: #a3be8c;
        background: #2e3440;
      }

      #cpu {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 10px 10px;
        color: #88c0d0;
        background: #2e3440;
      }

      #memory {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 10px 10px;
        color: #88c0d0;
        background: #2e3440;
      }

      #clock {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 10px 10px;
        color: #a3be8c;
        background: #2e3440;
      }

      #tray {
        margin-top: 6px;
        margin-right: 5px;
        margin-right: 5px;
        border-radius: 8px;
        padding-left: 10px;
        padding-right: 10px;
        color: #d8dee9;
        background: #2e3440;
      }

      #network {
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        padding-left: 10px;
        padding-right: 10px;
        color: #A3BE8C;
        background: #2e3440;
      }

      #idle_inhibitor {
        margin-top: 6px;
        margin-left: 5px; 
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 0 10px;
        color: #b48ead;
        background: #2e3440;
      }

      #custom-spotify{
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 8px;
        transition: none;
        padding: 0 20px 0 20px;
        color: #a3be8c;
        background: #2e3440;
      }

      #custom-media{
        margin-top: 6px;
        margin-left: 5px;
        margin-right: 5px; 
        border-radius: 8px;
        transition: none;
        padding: 0 20px 0 20px;
        color: #a3be8c;
        background: #2e3440;
      }

      #custom-notification{
         margin-top: 6px;
        margin-left: 5px; 
        margin-right: 5px; 
        border-radius: 8px;
        transition: none;
        padding-left: 10px;
        padding-right: 14px;
        color: #b48ead;
        background: #2e3440;
      }
    '';
   
    settings = {
      bar = {
        "height" = 37;
        "layer"= "top";
        "modules-left"= ["custom/powermenu" "tray" "hyprland/window"];
        "modules-center"= ["hyprland/workspaces"];
        "modules-right"= ["temperature" "cpu" "memory" "clock" "pulseaudio" "battery" "network" "idle_inhibitor" "custom/notification"];

        "hyprland/workspaces"= {
            "disable-scroll"= false;
            "format"= "{icon}";
            "format-icons"= {
                "1"= " ";
                "2"= " ";
                "3"= " ";
                "4"= " ";
                "5"= " ";
                "6"= " ";
                "7"= " ";
                "8"= " ";
                "9"= " ";
                "urgent"= " ";
                "focused"= " ";
            };
            "persistent-workspaces" = {
              "HDMI-A-1" = [1 2 3 4 5];
              "eDP-1" = [6 7 8 9];
            };
        };

        "hyprland/window"= {
        "rewrite"= {
            "(.*) - Brave" = "$1";
            "(.*) - Chromium"= "$1";
            "(.*) - Brave Search"= "$1";
        };
        "separate-outputs"= true;
        };

        "custom/powermenu"= {
            "format"= "";
            "interval"= "once";
            "on-click"= "rofi -show drun -show-icons";
            "tooltip"= false;
            "signal"= 8;
        };
        "idle_inhibitor"= {
            "format"= "{icon}";
            "format-icons"= {
                "activated"= " ";
                "deactivated"= " ";
            };
        };
        "pulseaudio/slider"= {
            "min"= 0;
            "max"= 100;
            "orientation"= "horizontal";
        };
        "tray"= {
            "spacing"= 10;
            "on-click"= "swaync-client -t";
        };
        "clock"= {
            "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            "format"= "{:%H:%M} ";
            "format-alt"= "{:%A, %B %d, %Y}  󰃭";
        };
        "cpu"= {
            "format"= "{usage}%  ";
            "tooltip"= false;
        };
        "memory"= {
            "format"= "{}%  ";
        };
        "temperature"= {
            "critical-threshold"= 80;
            "format"= "{temperatureC}°C {icon}";
            "format-icons"= [" " " " " "];
        };
        "backlight"= {
            "format"= "{icon} {percent}%";
            "format-icons"= [" " " "];
            "on-scroll-up"= "light -A 1";
            "on-scroll-down"= "light -U 1";
        };
        "battery"= {
            "states"= {
                "warning"= 30;
                "critical"= 15;
            };
            "format"= "{icon} {capacity}%";
            "tooltip-format"= "{timeTo}: {capacity}%";
            "format-charging"= "󰂄 {capacity}%";
            "format-plugged"= " ";
            "format-alt"= "{time} {icon}";
            "format-icons"= ["󰁻" "󰁽" "󰁿" "󰁿" "󰁹"];
        };
        "network"= {
            "format-wifi"= "   {essid}"; 
            "format-ethernet"= "{ifname}: {ipaddr}/{cidr} 󰈀 ";
            "format-linked"= "{ifname} (No IP)  ";
            "format-disconnected"= "睊 ";
            "tooltip-format"= "{essid} {signalStrength}%";
            "on-click"= "nm-applet";
        };
        "pulseaudio"= {
            "format"= "{icon}  {volume}% {format_source}";
            "format-bluetooth"= "{icon} {volume}% {format_source}";
            "format-bluetooth-muted"= "   {volume}% {format_source}";
            "format-muted"= "  {format_source}";
            "format-source"= "  ";
            "format-source-muted"= " ";
            "format-icons"= {
                "headphone"= "󰋋";
                "hands-free"= "󱖡";
                "headset"= "󰋋 ";
                "phone"= "";
                "portable"= "";
                "car"= "";
                "default"= ["󰝟" "󰕿" "󰖀" "󰕾"];
            };
            "tooltip-format"= "{desc}: {volume}%";
            "on-click"= "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "on-click-right"= "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
            "on-click-middle"= "pavucontrol";
        };
        "custom/notification"= {
            "tooltip"= false;
            "format"= "{icon}";
            "format-icons"= {
                "notification"= "<span foreground='red'><sup></sup></span>";
                "none"= "";
                "dnd-notification"= "<span foreground='red'><sup></sup></span>";
                "dnd-none"= "";
                "inhibited-notification"= "<span foreground='red'><sup></sup></span>";
                "inhibited-none"= "";
                "dnd-inhibited-notification"= "<span foreground='red'><sup></sup></span>";
                "dnd-inhibited-none"= "";
            };
            "return-type"= "json";
            "exec-if"= "which swaync-client";
            "exec"= "swaync-client -swb";
            "on-click"= "swaync-client -t -sw";
            "on-click-right"= "swaync-client -d -sw";
            "escape"= true;
        };
        "custom/spotify"= {
            "format"= "{icon} {}";
            "escape"= true;
            "return-type"= "json";
            "max-length"= 40;
            "interval"= 30; 
            "on-click"= "playerctl -p spotify play-pause";
            "on-click-right"= "killall spotify";
            "smooth-scrolling-threshold"= 10;
            "on-scroll-up" = "playerctl -p spotify next";
            "on-scroll-down" = "playerctl -p spotify previous";
            "exec" = "$HOME/.config/waybar/mediaplayer.sh";
            "exec-if"= "pgrep spotify";
        };
        "custom/media"= {
            "format"= "{icon} {}";
            "return-type" = "json";
            "max-length" = 40;
            "format-icons" = {
                "spotify" = " ";
                "default" = "󰎆 ";
            };
            "escape" = true;
            "exec" = "$HOME/.config/waybar/mediaplayer.sh";
            "on-click" = "playerctl play-pause";
        };
      "margin-top" = 5;
      "margin-bottom" = 5;
      "margin-left" = 5;
      "margin-right" = 5;
      "spacing" = 0;
      };
    };
  };

  home.file."./.config/waybar/" = {
    source = ./waybar;
    recursive = true;
  };

}
