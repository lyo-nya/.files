from libqtile.config import Key

from . import remaps


# Class that generates mappings for me.
# Its main purpose is to provide log of remaps and description for final mapping
# They are not used yet though
class Keyboard:
    def __init__(self, new_map: list = []) -> None:
        self.mapping_desc = {}
        self.log = ""
        self.mapping = []
        self.update_mapping(new_map)

    def make_key(self, keys: tuple) -> Key:
        keychain = keys[1] if (keys[0] == []) else "+".join(keys[0] + [keys[1]])
        mapdesc = {keychain: keys[3]}
        if keychain in self.mapping_desc:
            self.log += (
                f"Changed mapping of {keychain} from {self.mapping_desc[keychain]} to {keys[3]}\n")
        self.mapping_desc.update(mapdesc)
        return Key(*keys)

    def update_mapping(self, keys: list) -> None:
        keys = list(map(self.make_key, keys))
        self.mapping += keys

    def get_config(self) -> tuple:
        return (self.mapping, self.log, self.mapping_desc)


# Create mapping on import
if __name__ == "mapping.keyboard":
    # Combine remaps so that my own mappings follow default ones, so I can overwrite them
    keyboard_mapping = remaps.default_keyboard + remaps.my_mapping
    keyboard = Keyboard(new_map=keyboard_mapping)
    mapping, log, desc = keyboard.get_config()
