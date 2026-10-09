# Dotfiles

These dotfiles have evolved over over a decade of use.
Initially for both Linux and macOS, but now mostly focussed on macOS with apple silicon.
Most linux-related configs have been extracted to the `linux` branch to not pollute the macOS setup.

This repository is best used as a git bare repository ([see this](https://www.atlassian.com/git/tutorials/dotfiles)).

![Screenshot - macOS](https://i.imgur.com/masH4AS.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">macOS</p>

![Screenshot - Linux](https://i.imgur.com/6j6H7Yd.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">Linux (dark theme)</p>

![Screenshot - Linux](https://i.imgur.com/v9Eg7KR.png)
<!--suppress HtmlDeprecatedAttribute --><p align="center">Linux (light theme)</p>


## What’s included?

Configurations for both:
- zsh
- bash (fallback; kept rather minimal and self-contained)
- tmux
- vim
- vscode
- git and lazygit
- bat
- smol things like gh, sqlite and neofetch

Configurations for macOS:
- iterm2
- karabiner elements
- custom keyboard layout (`.config/mac-xkb-adaptation.bundle`)
- linearmouse

Configurations for linux:
- awesomewm
- alacritty
- dunst
- zathura
- rofi (light & dark variants)
- custom xkb keymap (`.config/janina-layout`)
- [logiops](https://github.com/PixlOne/logiops/)
- cool little custom color picker (with history functionality) called pick-color


## How to install

As dotfiles can go into different places but are almost always found in `$HOME` the installation differs a bit from a regular repository.
Using a [bare repository](https://www.atlassian.com/git/tutorials/dotfiles) located in the home directory is nice because:
- experimentation with configs is easy, just edit the files (no templating system involved, unlike in some ansible or nix/home-manager setups)
- you can easily make changes, commit, and push them. mirrors what you know from all other projects
- you can view diffs and see what changed (this is a huge improvement)

The installation is as follows:

```shell
# only needed once, afterwards the zsh config sets this
alias dots="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
echo ".cfg" >> .gitignore # this is to avoid weird recursion problems
git clone --bare --recurse-submodules https://www.github.com/JaninaWibker/dots $HOME/.cfg
dots checkout
# this avoids having git status polluted with random files
dots config --local status.showUntrackedFiles no
# source the newly added files
zsh
```

In general use `dots` everywhere where you would normally use `git` for dealing with these dotfiles.

- `dots submodule update --recursive --remote` to update all submodules.
- `dots submodule init` when a completely new submodule got added

## What to install as well?

> isn't up-to-date, this changes too often and it is too easy to forget to update this

**Both**: tmux, zsh, vim, git, vscode, spotify, browser, discord, cloc, ffmpeg, jq, node, python, sqlite, typst, inkscape, tailscale, obsidian

**macOS** karabiner-elements, iterm2, rectangle, linearmouse, shottr, figma, busycal, orion

**Linux** dunst, nsxiv, rofi, zathura, alacritty, überzug, betterlockscreen, xidlehook, awesome wm, xclip (and similar), spicetify, zoomer, flameshot, font manager, colorpicker, krita, thunar


**Browser extensions**:
- ublock origin
- bitwarden
- refined github
- extension to switch to previously active tab via shortcut (there are multiple of those)
- sponsorblock
- html5 video keyboard shortcuts
- custom playback speed for youtube (there are multiple of those)

## Other notes

The logiops config file comes with the following mappings:

![logoips button mapping](https://i.imgur.com/PLvz6mR.png)


The custom xkb layout (as well as my own custom keyboard - [jdkbd](https://github.com/JaninaWibker/jdkbd)) look like this currently:

![custom keyboard layout](https://i.imgur.com/2JjFp4k.png)

> http://www.keyboard-layout-editor.com/#/gists/153a860001da7b2fd4cc9ee0bf72accb


### VS Code

For vscode to use the files under `.config/vscode` you have to do a bit of symlink hackery to link the ones from the vscode installation directory to the ones in `.config`.

**Utilities**

- atom keymap
- toggle
- hexdump for vscode
- better comments
- colorize
- unique lines
- vscode-pdf

**Themes**

- light pink
- rosé pine
- city lights
- cyberpunk

**Syntax Highlighting & Language Support**

- web dev
  - mdx
  - tailwind intellisense
  - biome
  - eslint
  - prettier
  - pretty typescript errors
  - svg
- typst: tinymist, ltex+
- bnf & ebnf highlighting
- c/c++, codeLLDB
- java related (debugger for java, java test runner)
- python related (pylance, ruff, etc.)
- container tools, docker
- github actions
- nix ide
- configuration languages, etc.: dotenv, yaml, just


## Scripts (linux)

Scripts are contained in the `$HOME/scripts` folder. Currently these scripts exist:
- `change-theme <dark|light>`: toggle between light / dark theme
- `generate-lock-screen`: generate a lockscreen based on the `$XDG_CONFIG_HOME/awesome/themes/blue/wallpaper/lockscreen-adjusted.png` file (not commited; **requires betterlockscreen**)
- `idle-lock-screen`: start listening for inactivity and after 2 minutes lock the screen (**requires xidlehook, betterlockscreen**)
- `lock-screen <screen-off>?`: lock the screen, turns of the screen after 5 seconds if `screen-off` is the first argument (**requires betterlockscreen**)
- `quad-screen-xrandr`: configure monitor arrangement for 4-monitor setup (depends on `$HIGH_DPI`-env variable)
- `imgcat <file>`: display image file in terminal (**requires ueberzug**)
- `tex2svg`: compile a tex file into an svg file (using [dvisvgm](https://dvisvgm.de/Downloads/))
