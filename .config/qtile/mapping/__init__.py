from . import keyboard, mouse, remaps


# This seems like convenient way to hide everything from main configuration script
def generate():
    keyboard_mapping = keyboard.mapping
    mouse_mapping = mouse.mapping
    return keyboard_mapping, mouse_mapping
