# Paige

Paige is a light colourscheme for vim with ultra minimal syntax highlighting,
high accessibility and pleasant colours.

<img src="https://git.sr.ht/~leon_plickat/paige/blob/master/.meta/example.png">

Inspired by the
[modus-operandi](https://protesilaos.com/codelog/2020-03-10-emacs-modus-themes-elpa/)
theme for emacs, Paige aims to be beautiful, yet accessible. For that purpose,
it follows a few simple design choices.

* Black text on white background, for the highest possible readability
* Syntax highlighting mostly with bold text instead of any colours, to reduce
  the visual noise on the screen to a minimum
* Avoiding crass contrasts for UI elements
* Highlighting text by changing the background instead of the foreground colour,
  with very few exceptions
* And many more...

## Versions

Paige ships with four versions.

* `paige` is the default theme.
* `paige-dark` is the dark version of Paige. Behold: Due to the constraints of
  the 256 colours vim colourschemes are limited to, the darkest colour that is
  not part of the first sixteen colours (which are usually overridden by terminal
  colour themes) is 232, which is only a dark gray (`#080808`).
* `paige-system` the default light version, but using system foreground (7) and
  background (0) colours.
* `paige-dark-system` the dark version, but using system foreground (7) and
  background (0) colours.

## Contributing

While I generally welcome contributions to my projects, please understand that
something like a colourscheme is extremely subjective. If you have any ideas,
send me an email, so we can discuss them.

However, patches I will most likely always accept are those which add support
for a previously unsupported vim plugin or feature, using only the already
predefined colours.


## Licensing

Paige is licensed under the GPLv3.


## Authors

Leon Plickat <leonhenrik.plickat@stud.uni-goettingen.de>
