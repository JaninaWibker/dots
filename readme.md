# Dotfiles

These dotfiles are a mixture of dotfiles across both Linux and Mac OS systems, some things only work on one but not the other. This repository is best used as a git bare repository ([see this](https://www.atlassian.com/git/tutorials/dotfiles)).

![Screenshot - Linux](https://i.imgur.com/hEFKuEZ.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">Linux</p>

![Screenshot - macOS](https://i.imgur.com/gn352UH.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">macOS</p>

## What’s included?

- dunst config
- rofi theme and config
- vimrc
- zathura
- zsh stuff ([oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh))
- some bash stuff
- st config / fork / build
- tmux config
- iterm2 config / theme (Default, Snazzy, Cyberpunk; currently using Default)
- alacritty config
- vscode settings (and list of installed packages)
- [yabai](https://github.com/koekeishiya/yabai) & [skhd](https://github.com/koekeishiya/skhd) config
- [karabiner elements](https://pqrs.org/osx/karabiner/) config
- custom xkb keymap (called ed as it’s a mixture of the “de” (german) layout and the [eurkey](https://eurkey.steffen.bruentjen.eu/) layout)
- lot’s of smaller config files like sqliterc, inputrc, …
- applescript scripts mostly for interacting with spotify (mostly included inside of zsh config)

## What’s not included?

My awesome config, as it’s located in it’s own git repo (and submodule) [here](https://github.com/JannikWibker/awesome-config).

## What to install (incl. optional)?

> These are lists of applications I often use, some of these have config files in this repo, some don’t.

**In general** install tmux, zsh, oh-my-zsh, zsh-completions, vim (newest version), git (newest version), VS-Code, SublimeText, Atom, Spotify, Chrome/Chromium, Vivaldi, Firefox, Insomnia, Discord, Typora, KDE-Connect, cloc, ffmpeg, gcc, gdb, gnuplot, jq, lua, nodejs, ruby, python, nano (newest version), wget, sqlite, mitm-proxy.

**On Mac OS** specifically install Karabiner Elements, iTerm2, TablePlus, Notion, Anybar, LuLu, VEEER, IINA, Tunnelblick, puuush,, Übersicht, yabai, skhd, Discovery.

**On Linux** specifically install dunst, rofi, zathura, st / alacritty / lxterminal, maybe awesome wm, xclip (and similar), Flameshot, Notion (using Lotion or some other method), Font Manager, Color Picker, InkScape, Gimp, Thunar / Nautilus, widevine related stuff (for chrome/chromium/vivaldi).

## Other notes


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
- LaTeX Workshop
- Live Share
- Live Share Chat
- Remote VSCode

**Syntax Highlighting & Language Support**

- bnf & ebnf highlighting
- c/c++
- checkstyle for java
- codeLLDB
- debugger for java
- docker
- **dotenv**
- gnuplot
- haskell syntax highlighting
- Language Support for Java by RedHat
- **Lua**
- vimL
