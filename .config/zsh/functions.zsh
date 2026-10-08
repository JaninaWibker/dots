function ipv4() {
  curl -s "https://v4.ident.me/"
  echo
}

function ipv6() {
  curl -s "https://v6.ident.me/"
  echo
}

function colortest() {
  bash "$XDG_CONFIG_HOME/zsh/scripts/colortest.sh"
}
