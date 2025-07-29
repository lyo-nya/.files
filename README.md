## Install on a new machine
### Clean way
1. Fork this repo
2. Change `user` and `hostname` according to your preference
3. Do regular nixos partitioning and config generation generation accoring to the [nixos installation guide](https://nixos.org/manual/nixos/stable/#sec-installation)
4. Clone your fork and `cd` into it
5. Override `hardware-configuration.nix` by copying it from `/mnt/etc/nixos/hardware-configuration.nix`
6. Push changes
7. Install from flake: `nixos-install --flake .#<your-hostname>`
8. Set password: `nixos-enter --root /mnt -c 'passwd <your-user-name>'`
9. Reboot
10. Clone your fork into the home directory

### One-shot way
1. Do regular nixos partitioning and config generation generation accoring to the [nixos installation guide](https://nixos.org/manual/nixos/stable/#sec-installation)
2. Clone this repo
3. Override `hardware-configuration.nix` by copying it from `/mnt/etc/nixos/hardware-configuration.nix`

After that, run the following:

```sh
# Then copy hadware configuration over to this repos root
cp /mnt/etc/nixos/hardware-configuration.nix hardware-configuration
# Install nixos from flake
nixos-install --flake .#large
# Set password for user
nixos-enter --root /mnt -c 'passwd lyonya'
# Reboot
reboot
```

## Should be part of the conifg
- [ ] [Telegram theme](https://github.com/catppuccin/telegram)
- [ ] Zen shortcuts

## Other
- [ ] Figure out notifications, it should be something with dbus, I guess
