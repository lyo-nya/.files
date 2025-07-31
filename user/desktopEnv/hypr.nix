{ lib }:
let
  inherit (lib.lists) imap1 flatten;
  mainMod = "CONTROL";
  altMod = "Alt";
  uwsm = app: "uwsm app -- ${app}";
  addAutoStart = app: {
    wayland.windowManager.hyprland.settings = {
      "exec-once" = [
        (uwsm app)
      ];
    };
  };
  setEnv = vars: { wayland.windowManager.hyprland.settings.env = vars; };
  bindSingleWorkspace = key: workspace: [
    "${mainMod}, ${toString key}, workspace, ${toString workspace}"

    "${altMod}, ${toString key}, movetoworkspace, ${toString workspace}"
  ];
  workspaceBindings = flatten (
    imap1 (i: k: bindSingleWorkspace k i) [
      1
      2
      3
      8
      9
      0
    ]
  );
  bindApp =
    isMain: key: app:
    let
      mod = if isMain then mainMod else altMod;
    in
    {
      wayland.windowManager.hyprland.settings.bind = [ "${mod}, ${key}, exec, ${uwsm app}" ];
    };

in
{
  runApp = uwsm;
  addAutoStart = addAutoStart;
  setEnv = setEnv;
  bindApp = bindApp;
  setup = {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        monitor = ",prefered,auto,1";
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
        bind = [
          # Hyrpland controls
          "${altMod}, F, fullscreen,"
          "${mainMod}, R, togglesplit,"
          "${mainMod}, Q, killactive,"
          "${mainMod}, M, exit,"
          # Navigation
          "${mainMod}, L, movefocus, l"
          "${mainMod}, H, movefocus, r"
          "${mainMod}, K, movefocus, u"
          "${mainMod}, J, movefocus, d"
          #
        ] ++ workspaceBindings;
        bindm = [
          "${mainMod}, mouse:272, movewindow"
          "${mainMod}, mouse:273, resizewindow"
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
      systemd.enable = false;
      xwayland.enable = true;
    };
  };
}
