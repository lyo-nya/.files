{ pkgs, ... }:

let
  inherit (pkgs.lib) lists range;
  themes = import ../theme "hyprland";
  wallpaper = builtins.toString ./wallpaper.jpg;
  uwsm = app: "uwsm app -- ${app}";
  cursor = ''"Bibata-Modern-Ice"'';
  mod = a: b: a - (b * (a / b));
  workspaceBinds = lists.flatten (
    map (
      x:
      let
        key = if x > 3 then (mod (x + 4) 10) else x;
      in
      [
        "$mainMod, ${toString key}, workspace, ${toString x}"
        "$mainMod SHIFT, ${toString key}, movetoworkspace, ${toString x}"

      ]
    ) (range 1 6)
  );
  cursorTheme = lists.flatten (
    map
      (x: [
        "${x}_NAME,${cursor}"
        "${x}_SIZE,30"
      ])
      [
        "XCURSOR"
        "HYPRCURSOR"
      ]
  );
in
{
  inherit (themes) catppuccin;
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      preload = [ wallpaper ];
      wallpaper = [ ",${wallpaper}" ];
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mainMod" = "CONTROL";
      monitor = ",prefered,auto,1";
      "$terminal" = uwsm "kitty";
      "$browser" = uwsm "zen";
      "$drun" = uwsm "rofi -show drun";
      "$screenshot" = uwsm "hyprshot -m region --clipboard-only";
      "$info" = "$(${builtins.toString ./notification.sh})";
      "exec-once" = [
        (uwsm "mako")
        (uwsm "hyprpaper")
        (uwsm "hyprctl setcursor ${cursor} 30")
      ];
      env = cursorTheme;
      ecosystem.no_update_news = true;
      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        resize_on_border = true;
      };
      decoration = {
        shadow.enabled = false;
        blur.enabled = false;
      };
      animations.enabled = false;
      dwindle.preserve_split = true;
      master.new_status = "master";
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:ctrl_shift_toggle,ctrl:swap_lwin_lctl";
        kb_variant = "mac";
      };
      bind = workspaceBinds ++ [
        # Apps
        "$mainMod, T, exec, $terminal"
        "$mainMod, I, exec, $info"
        "$mainMod, W, exec, $browser"
        "$mainMod, SPACE, exec, $drun"
        "$mainMod, P, exec, $screenshot"
        "$mainMod SHIFT, P, exec, $screen_rec"
        # Hyrpland controls
        "$mainMod SHIFT, F, fullscreen,"
        "$mainMod, R, togglesplit,"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        # Navigation
        "$mainMod, L, movefocus, l"
        "$mainMod, H, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"
        #

      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindl = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      windowrulev2 = [
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        "suppressevent maximize, class:.*"
      ];

    };

    systemd.enable = true;
    xwayland.enable = true;

  };
}
