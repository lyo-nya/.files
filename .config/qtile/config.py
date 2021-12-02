# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# I don't know if I have to keep this thing above, but since developers put it
# basically everywhere, I will also keep it, even though it annoys me

import os
import subprocess

# Import mappings
import mapping
# Import qtile objects and functions
from libqtile import bar, hook, layout
from libqtile.command import lazy
from libqtile.config import DropDown, Group, Key, ScratchPad, Screen
from libqtile.dgroups import simple_key_binder
# Import widgets
from widgets import widget_defaults, widget_list

keys, mouse = mapping.generate()
widget_defaults = widget_defaults

# I don't need labels for all numbers, since I only use ones, that I can reach quickly
group_labels = "123890"
groups = [Group(i) for i in group_labels]

# Add group for dropdown file manager (LF in my case)
groups += [
    ScratchPad("file manager", [
        DropDown("LF",
                 "alacritty -e lf",
                 x=0.1,
                 y=0.1,
                 width=0.8,
                 height=0.8,
                 opacity=1,
                 on_focus_lost_hide=True)
    ]),
]

# Create shortcut
keys.append(Key([mapping.remaps.mod], 'f', lazy.group['file manager'].dropdown_toggle('LF')))

# I prefer all windows to look the same
layout_defaults = {
    "border_focus": "#d75f5f",
    "border_normal": "#ffffff",
    "border_width": 3,
    "margin": 3,
    "margin_on_single": [0, 0, 3, 0],
}

# I only really use columns layout
layouts = [layout.Columns(**layout_defaults)]

# Change the appearance of floating windows
floating_layout = layout.Floating(
    float_rules=[*layout.Floating.default_float_rules],
    **layout_defaults,
)

# I only use one screen
screens = [
    Screen(
        wallpaper="~/Pictures/wallpaper.jpg",
        wallpaper_mode="fill",
        bottom=bar.Bar(
            widgets=widget_list,
            size=40,
            margin=[0, 0, 0, 0],
            background="#ffffff",
        ),
    ),
]

# Use groups labels to navigate
dgroups_key_binder = simple_key_binder(mapping.remaps.mod, group_labels)


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
