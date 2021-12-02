from os import getenv

from . import actions

# Keyboard modifier
mod = "mod4"

# Programs
TERMINAL = getenv("TERMINAL")
BROWSER = getenv("BROWSER")

# Keyboard mappings
my_mapping = [
    # [Modifier], [Key], [Action], [Description]
    ([mod], "Return", actions.spawn(TERMINAL), "Open terminal"),
    ([mod], "w", actions.spawn(BROWSER), "Open web browser"),
    ([mod], "d", actions.dmenu, "Open prompt"),
    ([mod], "F12", actions.spawn("rotate_audio_sinks"), "Change audio device"),
    ([], "XF86Mail", actions.spawn("touchpad_toggle"), "Toggle touchpad"),
    ([], "XF86AudioRaiseVolume", actions.spawn("amixer -q sset Master 5%+"),
     "Increase volume by 5%"),
    ([], "XF86AudioLowerVolume", actions.spawn("amixer -q sset Master 5%-"), "Lower Volume by 5%"),
    ([], "XF86AudioMute", actions.spawn("amixer -q sset Master toggle"), "Mute audio"),
    ([], "Print", actions.spawn("flameshot gui"), "Mute audio"),
    ([], "XF86MonBrightnessUp", actions.spawn("xbacklight -inc 10"), "Increase brightness"),
    ([], "XF86MonBrightnessDown", actions.spawn("xbacklight -dec 10"), "Decrease brightness"),
]

# Defaults
default_keyboard = [
    ([mod], "l", actions.move_right, "Move cursor to the left"),
    ([mod], "h", actions.move_left, "Move cursor to the right"),
    ([mod], "j", actions.move_down, "Move cursor down"),
    ([mod], "k", actions.move_up, "Move cursor up"),
    ([mod], "space", actions.move_next, "Move cursor to next window"),
    ([mod, "shift"], "l", actions.shuffle_right, "Move window to the left"),
    ([mod, "shift"], "h", actions.shuffle_left, "Move window to the right"),
    ([mod, "shift"], "j", actions.shuffle_down, "Move window down"),
    ([mod, "shift"], "k", actions.shuffle_up, "Move window up"),
    ([mod, "control"], "l", actions.grow_right, "Grow window to the left"),
    ([mod, "control"], "h", actions.grow_left, "Grow window to the right"),
    ([mod, "control"], "j", actions.grow_down, "Grow window down"),
    ([mod, "control"], "k", actions.grow_up, "Grow window up"),
    ([mod], "Tab", actions.switch_layouts, "Toggle between layouts"),
    ([mod], "q", actions.kill_window, "Kill window"),
    ([mod, "control"], "r", actions.qtile_restart, "Restart qtile"),
    ([mod, "control"], "q", actions.qtile_kill, "Shutdown Qtile"),
]
