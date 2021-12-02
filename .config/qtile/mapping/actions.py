from libqtile.command import lazy

# This script defines basic qtile actions, that I use in mappings but in shorter form 

move_left = lazy.layout.left()
move_right = lazy.layout.right()
move_down = lazy.layout.down()
move_up = lazy.layout.up()
move_next = lazy.layout.next()

shuffle_left = lazy.layout.shuffle_left()
shuffle_right = lazy.layout.shuffle_right()
shuffle_down = lazy.layout.shuffle_down()
shuffle_up = lazy.layout.shuffle_up()

grow_left = lazy.layout.grow_left()
grow_right = lazy.layout.grow_right()
grow_down = lazy.layout.grow_down()
grow_up = lazy.layout.grow_up()

switch_layouts = lazy.next_layout()
kill_window = lazy.window.kill()

qtile_restart = lazy.restart()
qtile_kill = lazy.shutdown()

# This is not actually a dmenu instance, I just call it this way since I use it
# as if it was a dmenu
dmenu = lazy.spawncmd()

def spawn(cmd):
    return lazy.spawn(cmd)
