# This is default configuration
from libqtile.config import Click, Drag
from libqtile.lazy import lazy

from . import remaps

mapping = [
    Drag(
        [remaps.mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [remaps.mod],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([remaps.mod], "Button2", lazy.window.bring_to_front()),
]
