## My dotfiles
This is the collection of my configuration files.
## Requirements
I run arch (BTW), but this settings should work on any other distro.
The following packages are required for everything to run as expected:
* Arch Repository: 
    - zsh
    - ninja
    - pulseaudio
    - alsa-utils
    - pulseaudio-alsa
    - ttf-ibm-plex
    - noto-fonts
    - ripgrep
    - fd
    - cargo
    - exa
    - alacritty
    - chromium
    - qtile
    - xclip
    - libsecret
    - gnome-keyring
    - efm-langserver
    - cbatticon
    - volumeicon
    - flameshot
    - shellcheck
    - shfmt
    - unzip
    - p7zip
    - unrar
* AUR:
    - lua-format
    - lf
    - neovim-git
    - nerd-fonts-jetbrains-mono
    - nvim-packer-git
* pip:
    - yapf
    - pyright
    - isort
    - yamllint
* Other:
    - [lua-language-server](https://github.com/sumneko/lua-language-server) built in `~/.local/share/lua-language-server`
    - Some wallpaper in `~/Pictures/wallpaper.jpg`
    - zsh set as the default shell
## Usage
There are basically three ways one can make use of this files:
1. You can **borrow** some snippets for yourself by reading through code.
2. You can **fork** this repository and build your configuration on top of mine.
3. You can **clone** this repository and use this configuration as is.
You should employ this option only if you are not going to change anything.
Otherwise, use fork option and then clone your own repository.

### Cloning
This files are supposed to be stored in bare git repository (see [this article](https://www.atlassian.com/git/tutorials/dotfiles) for example)
So to clone this configuration files, use can use the following command
```
git clone --bare https://github.com/lyo-nya/.files.git $HOME/.files
```
This will initialize bare git repository in `~/.files` directory.

After that, you can execute
```
/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME checkout
```
If you are on clean install, this will make the job done.
Otherwise, backup your files if needed and run the same command with `-f` flag.

Once files are set up, you can use `config` command instead of `git` to manage your local git repository.
This alias is set up in `.config/zsh/aliases.zsh`
```
alias config="/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME"
```

#### TODO
- [ ] Configure LF
