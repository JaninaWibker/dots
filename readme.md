# Dotfiles

These dotfiles are a mixture of dotfiles across both Linux and Mac OS systems, some things only work on one but not the other. This repository is best used as a git bare repository ([see this](https://www.atlassian.com/git/tutorials/dotfiles)).

![Screenshot - Linux](https://i.imgur.com/73GMQyJ.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">Linux (dark theme)</p>

![Screenshot - Linux](https://i.imgur.com/YNQvXI0.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">Linux (light theme)</p>


![Screenshot - macOS](https://i.imgur.com/gn350UH.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">macOS</p>

## What’s included?

Configurations for:
- awesomewm
- tmux
- iterm2 (themes: Default, Snazzy, Cyberpunk; currently using Default)
- alacritty
- dunst
- rofi (light & dark variants)
- vimrc (and plugins)
- zathura
- zsh ([oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh))
- neofetch ([custom build](https://github.com/JannikWibker/neofetch) with ([überzug](https://github.com/seebye/ueberzug) support)
- vscode (and list of installed packages)
- [yabai](https://github.com/koekeishiya/yabai) & [skhd](https://github.com/koekeishiya/skhd)
- [karabiner elements](https://pqrs.org/osx/karabiner/)
- [logiops](https://github.com/PixlOne/logiops/) (MX Master 3)
- lot’s of smaller config files like sqliterc, inputrc, …

Other things
- XCompose file
- custom xkb keymap (called ed as it’s a mixture of the “de” (german) layout and the [eurkey](https://eurkey.steffen.bruentjen.eu/) layout)
- a custom color picker (with history functionality) called pick-color (using [colorpicker](https://aur.archlinux.org/packages/colorpicker/))
- scripts for
  - controlling spotify (applescript)
  - changing theme,
  - lock-screen related things and
  - xrandr


## How to install

The installation differs a bit from just normally cloning the repo and using it as the files belong in vastly different locations and not in a single folder, that is the reason I use a [git bare repository](https://www.atlassian.com/git/tutorials/dotfiles) for my dotfiles.

The installation is as follows:

```shell
# this is only needed temporarily, the ZSH config includes this line as well, no need to manually add this somewhere.
alias dots=/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME
echo ".cfg" >> .gitignore # this is to avoid weird recursion problems
git clone --bare --recurse-submodules https://www.github.com/JannikWibker/dots $HOME/.cfg
dots checkout
# this avoids having git status polluted with random files
dots config --local status.showUntrackedFiles no
# source the newly added files
zsh
# this initializes a lot of config files like explained in "Other notes"
change-theme dark
```

In general use `dots` everywhere where you would normally use `git` for dealing with these dotfiles.

When updating use `dots submodule update --recursive --remote` to update all submodules.
Incase a completely new submodule was added running `dots submodule init` before is required in order to tell git that new submodules exist that need updating.

## What to install (incl. optional)?

> These are lists of applications I often use, some of these have config files in this repo, some don’t.

**In general** install tmux, zsh, oh-my-zsh, zsh-completions, vim (newest version), git (newest version), VS-Code, SublimeText, Atom, Spotify, Chrome/Chromium, Vivaldi, Firefox, Insomnia, Discord, Typora, KDE-Connect, cloc, ffmpeg, gcc, gdb, gnuplot, jq, lua, nodejs, ruby, python, nano, curl, wget, sqlite, neofetch, mitm-proxy, some latex distribution, dvisvgm, rust, cm.

**On Linux** specifically install dunst, sxiv, rofi, zathura, alacritty, überzug, betterlockscreen (-git on arch as the other version is pretty outdated and doesn't support "--off"), xidlehook, maybe awesome wm, xclip (and similar), spicetify, zoomer, Flameshot, Notion (using Lotion or some other method), Font Manager, colorpicker, InkScape, Gimp, Krita, Thunar, widevine related stuff (for chrome/chromium/vivaldi).

**On Mac OS** specifically install Karabiner Elements, iTerm2, TablePlus, Notion, Anybar, LuLu, Rectangle, IINA, Tunnelblick, puush, Übersicht, yabai, skhd, Discovery, Witch, ScrollReverser, DiscreteScroll.

**Browser extensions**:
alt-q (private personal fork),
[auto scroll](https://chrome.google.com/webstore/detail/autoscroll/occjjkgifpmdgodlplnacmkejpdionan),
[html5 video keyboard shortcuts](https://chrome.google.com/webstore/detail/html5-video-keyboard-shor/llhmaciggnibnbdokidmbilklceaobae),
[ublock origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm),
[enhancer for youtube](https://chrome.google.com/webstore/detail/enhancer-for-youtube/ponfpcnoihfmfllpaingbgckeeldkhle),
[betterttv](https://chrome.google.com/webstore/detail/betterttv/ajopnjidmegmdimjlfnijceegpefgped),
[frankerfacez](https://chrome.google.com/webstore/detail/frankerfacez/fadndhdgpmmaapbmfcknlfgcflmmmieb),
[unwanted twitch](https://chrome.google.com/webstore/detail/unwanted-twitch/egbpddkgpjmliolmpjenjomflclekjld),
[bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb),
[cookie autodelete](https://chrome.google.com/webstore/detail/cookie-autodelete/fhcgjolkccmbidfldomjliifgaodjagh),
[dark reader](https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh),
[zhongwen chinese english dictionary](https://chrome.google.com/webstore/detail/zhongwen-chinese-english/kkmlkkjojmombglmlpbpapmhcaljjkde)

## Other notes

It is important to run `$HOME/scripts/change-theme dark` once after installation, as the many config files are generated by switching the theme (the base file and a specific file only containing the config for a theme are concatinated into the complete config file which is not in the repo).

The logiops config file comes with the following mappings:

![logoips button mapping](https://i.imgur.com/PLvz6mR.png)


## Scripts

Scripts are contained in the `$HOME/scripts` folder. Currently these scripts exist:
- `change-theme <dark|light>`: toggle between light / dark theme
- `generate-lock-screen`: generate a lockscreen based on the `$XDG_CONFIG_HOME/awesome/themes/blue/wallpaper/lockscreen-adjusted.png` file (not commited; **requires betterlockscreen**)
- `idle-lock-screen`: start listening for inactivity and after 2 minutes lock the screen (**requires xidlehook, betterlockscreen**)
- `lock-screen <screen-off>?`: lock the screen, turns of the screen after 5 seconds if `screen-off` is the first argument (**requires betterlockscreen**)
- `quad-screen-xrandr`: configure monitor arrangement for 4-monitor setup (depends on `$HIGH_DPI`-env variable)
- `imgcat <file>`: display image file in terminal (**requires ueberzug**)
- `tex2svg`: compile a tex file into an svg file (using [dvisvgm](https://dvisvgm.de/Downloads/))

### VS Code

VS Code configs are split between linux and mac, the linux files are inside "config/Code - OSS/User/" while the mac files are inside ".vscode-symlink/" (this is because of how the settings are implemented on my mac installation). The files may be somewhat out of sync, also the reason behind the split is different keybinds (because mac os has an extra modifier with the cmd key), so they are different by design.

> important packages are in bold

**Settings / Keyboard Shortcuts / ...**

- **atom keymap**
- **block travel**
- **clock in status bar** 
- **Toggle**

**Themes**

- city lights icon package
- city lights theme
- **cyberpunk (SCARLET; active theme)**

**Other**

- **Markdown Preview Enhanced**
- **hexdump for VSCode**
- **better comments**
- **colorize**
- Unique Lines
- LaTeX Workshop
- Live Share
- Live Share Chat
- Remote VSCode
- change-case

**Syntax Highlighting & Language Support**

- bnf & ebnf highlighting
- c/c++
- checkstyle for java
- codeLLDB
- debugger for java
- java test runner
- docker
- **dotenv**
- gnuplot
- haskell syntax highlighting
- Language Support for Java by RedHat
- **lua-language-server**
- Nim language support
- vimL
- x86 / x64 Assembly
