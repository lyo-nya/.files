from libqtile.widget import clock, groupbox, prompt, spacer, systray

widget_defaults = dict(
    font="IBM Plex Mono",
    fontsize=28,
    padding=15,
)

colors = [
    "#000000",  # Default text color
    "#d90909",  # Active tab color
    "#2acaea",  # Dmenu background
]

widgets = [
    groupbox.GroupBox(
        foreground=colors[0],
        active=colors[1],
        rounded=False,
        margin=0,
        borderwidth=2,
    ),
    spacer.Spacer(),
    prompt.Prompt(
        foreground=colors[0],
        background=colors[2],
        prompt="",
        cursor=False,
        fontsize=30,
        ignore_dups_history=True,
    ),
    spacer.Spacer(),
    systray.Systray(icon_size=28),
    clock.Clock(format="%d.%m %a %H:%M", foreground=colors[0]),
]
