## Instructions
Do regular partitioning and config generation accoring to the (nixos installation guide)[https://nixos.org/manual/nixos/stable/#sec-installation].
Then do the following:

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

To change host or user name, edit `flake.nix` file:
```nix
...
      user = "lyonya";
      hostname = "large";
...
```

In that case, you woud use the following commands on installation stage:

```sh
...
# Install nixos from flake
nixos-install --flake .#<your-hostname>
# Set password for user
nixos-enter --root /mnt -c 'passwd <your-user-name>'
...
```

## Should be part of the conifg
- [ ] [Telegram theme](https://github.com/catppuccin/telegram)
- [ ] Zen shortcuts

## Other
- [ ] Figure out notifications, it should be something with dbus, I guess
