{inputs, pkgs, ...}:{
   wayland.windowManager.hyprland = {
       enable = true;
       xwayland.enable = true;
       plugins = [
       ];
       extraConfig = ''
            monitor=HDMI-A-1,2560x1440@144,0x0,1
            #monitor=HDMI-A-1,1920x1080,0x0,1
            monitor=eDP-1,1920x1080@144,auto,1

            env = LIBVA_DRIVER_NAME,nvidia
            env = XDG_SESSION_TYPE,wayland

            env = GBM_BACKEND,nvidia-drm
            env = __GLX_VENDOR_LIBRARY_NAME,nvidia
            env = WLR_NO_HARDWARE_CURSORS,1

            exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
            # exec-once=systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

            exec-once=ssh-add

            workspace=1,monitor:HDMI-A-1
            workspace=2,monitor:HDMI-A-1
            workspace=3,monitor:HDMI-A-1
            workspace=4,monitor:HDMI-A-1
            workspace=5,monitor:HDMI-A-1
            workspace=6,monitor:eDP-1
            workspace=7,monitor:eDP-1
            workspace=8,monitor:eDP-1
            workspace=9,monitor:eDP-1

          # See https://wiki.hyprland.org/Configuring/Keywords/ for more

          # Execute your favorite apps at launch
          # exec-once = waybar & hyprpaper & swaync
          exec-once = hyprpaper & spotify & swaync & waybar
          # Source a file (multi-file configs)
          # source = ~/.config/hypr/myColors.conf

          # Some default env vars.
          env = XCURSOR_SIZE,24

          # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
          input {
              kb_layout = hr
              kb_variant =
              kb_model =
              kb_options =
              kb_rules =

              follow_mouse = 1

              touchpad {
                  natural_scroll = no
              }

              sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          }

          general {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more

              gaps_in = 5
              gaps_out = 5
              border_size = 2
              col.active_border = rgba(88c0d0ee) 45deg
              col.inactive_border = rgba(595959aa)

              layout = master

              # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
              allow_tearing = false
          }

          decoration {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more

              rounding = 10

              blur {
                  enabled = true
                  size = 3
                  passes = 1
              }

              drop_shadow = yes
              shadow_range = 4
              shadow_render_power = 3
              col.shadow = rgba(1a1a1aee)
          }

          animations {
              enabled = yes

              # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

              bezier = myBezier, 0.05, 0.9, 0.1, 1.05

              animation = windows, 1, 7, myBezier
              animation = windowsOut, 1, 7, default, popin 80%
              animation = border, 1, 10, default
              animation = borderangle, 1, 8, default
              animation = fade, 1, 7, default
              animation = workspaces, 1, 6, default
          }

          dwindle {
              # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
              pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
              preserve_split = yes # you probably want this
          }

          master {
              # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
              new_is_master = true

          }

          gestures {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              workspace_swipe = off
          }

          misc {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
          }

          # Example per-device config
          # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
          device {
              name = epic-mouse-v1
              sensitivity = -0.5
          }

          # Example windowrule v1
          # windowrule = float, ^(kitty)$
          # Example windowrule v2
          # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

          windowrulev2 = maximize, title:^(Spotify Premium)$
          windowrule = workspace 6 silent, title:^(Spotify Premium)$


          # See https://wiki.hyprland.org/Configuring/Keywords/ for more
          $mainMod = ALT

          # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
          bind = $mainMod SHIFT, Return, exec, alacritty
          bind = $mainMod SHIFT, C, killactive,
          bind = $mainMod SHIFT, B, exec, brave
          bind = $mainMod SHIFT, L, exec, hyprlock
          bind = $mainMod, V, togglefloating,
          bind = $mainMod, P, exec, rofi -show drun -show-icons
          bind = $mainMod, Return, layoutmsg, swapwithmaster master
          bind = $mainMod , M, fullscreen, 1

          # Move focus with mainMod + arrow keys
          bind = $mainMod, h, movefocus, l
          bind = $mainMod, l, movefocus, r
          bind = $mainMod, k, layoutmsg, cyclenext
          bind = $mainMod, j, layoutmsg, cycleprev

          # Switch workspces with mainMod + [0-9]
          bind = $mainMod, 1, workspace, 1
          bind = $mainMod, 2, workspace, 2
          bind = $mainMod, 3, workspace, 3
          bind = $mainMod, 4, workspace, 4
          bind = $mainMod, 5, workspace, 5
          bind = $mainMod, 6, workspace, 6
          bind = $mainMod, 7, workspace, 7
          bind = $mainMod, 8, workspace, 8
          bind = $mainMod, 9, workspace, 9

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
          bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
          bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
          bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
          bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
          bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
          bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
          bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
          bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9


          # Example special workspace (scratchpad)
          bind = $mainMod, S, togglespecialworkspace, magic
          bind = $mainMod SHIFT, S, movetoworkspace, special:magic
          #Waybar config
          # Scroll through existing workspaces with mainMod + scroll
          bind = $mainMod, mouse_down, workspace, e+1
          bind = $mainMod, mouse_up, workspace, e-1

          # Move/resize windows with mainMod + LMB/RMB and dragging
          bindm = $mainMod, mouse:272, movewindow
          bindm = $mainMod, mouse:273, resizewindow
       '';
   };
       home.file."./.config/hypr/" = {
            source = ./hypr;
            recursive = true;
       };

}
