unalias md
function md() {
  mkdir -p "$@" && cd "$@"
}

function ipv4() {
  curl -s "https://v4.ident.me/"
  echo
}

function ipv6() {
  curl -s "https://v6.ident.me/"
  echo
}

function watch() {
  fswatch -0 $1 | xargs -0 -n 1 -I{}
}

function scan_image() {
  f=/tmp/kde-connect-$(date +"%Y_%m_%d_%I_%M_%p").jpg
  kdeconnect-cli -d 34e0e0ec4264adf8 --photo ${f}
  while [ ! -f ${f} ]
  do
    sleep 0.25
  done
  convert "${f}" png:- | xclip -sel clip -t image/png
  rm ${f}
}

function spotify_now_playing() {
  osascript -e "display notification \"$(spotify info song)\" with title \"$(spotify info state) Spotify - $(spotify info time)\""
}
function info() {
  local spotifyPlaying="%{$fg[white]%}none"
  if [ $(spotify info player) = "playing" ]; then
    spotifyPlaying="$(spotify info song)"
  fi
  print -P "%{$fg[white]%}⚡\t$(batt)% ($(battsrc))"
  print -P "local\t$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' )"
  print -P "v4\t$(ipv4)"
  print -P "v6\t$(ipv6)"
  print -P "%{$fg[green]%}▶\t${spotifyPlaying}"
  print -P "%{$fg[magenta]%}\t$(defaults read loginwindow SystemVersionStampAsString)"
  print -P "%{$fg[green]%}⬢\t$(node -v)"
  print -P "%{$fg[red]%}npm\t$(npm -v)"
  print -P "%{$fg[cyan]%}chrome\t$( /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --version | grep -Eo '([0-9]+.[0-9]+.[0-9]+.[0-9]+)')"
  print -P "%{$fg[blue]%}git\t$(git --version | grep -Eo '([0-9]+.[0-9]+.[0-9]+)')"
  print -P "%{$fg[white]%}"
  git status
}

function server() { # runs a local server with the npm package 'statik'
  local port="${1:-8000}"
  local path="${2:-$(pwd)}"
  open "http://localhost:${port}/" # opens chrome and goes to localhost:$port
  statik --port "$port" "$path"
}

cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`" # cd's to the folder currently opened in finder
}

function whois() {
	local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
	if [ -z $domain ] ; then
		domain=$1
	fi
	echo "Getting whois record for: $domain …"

	# avoid recursion
					# this is the best whois server
													# strip extra fluff
	/usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

function localip(){
	function _localip(){ echo "📶  "$(ipconfig getifaddr "$1"); }
	export -f _localip
	local purple="\x1B\[35m" reset="\x1B\[m"
	networksetup -listallhardwareports | \
		sed -E "s/Hardware Port: (.*)/${purple}\1${reset}/g" | \
		sed -E "s/Device: (en.*)$/_localip \1/e" | \
		sed -E "s/Ethernet Address:/📘 /g" | \
		sed -E "s/(VLAN Configurations)|==*//g"
}

function vol() {
  bold=$(tput bold)
  reset=$(tput sgr0)
  orange=$(tput setaf 172)
  purple=$(tput setaf 141)
  if [ $# -eq 0 ]; then
    echo "${bold}Usage${reset}
    ${bold}${orange}-${reset} vol [${bold}1${reset}-${bold}10${reset}]${reset}    // this sets the volume to the specified level
    ${bold}${orange}-${reset} vol ${bold}mute ${reset}     // this mutes the volume
    ${bold}${orange}-${reset} vol ${bold}unmute ${reset}   // this unmutes the volume"
  elif [ $1 = "mute" ]; then
    osascript -e "set volume output muted true";
  elif [ $1 = "unmute" ]; then
    osascript -e "set volume output muted false";
  else
    osascript -e "set volume ${1}"
  fi
}

function fs() {
  size=$(stat -f "%z" $1)
  kb=1024
  mb=1048576
  gb=1073741824
  tb=1099511627776
  if [ $size -gt $tb ]; then
    echo "$(bc -l <<< "scale=2; ${size} / ${tb}")tb"
  elif [ $size -gt $gb ]; then
    echo "$(bc -l <<< "scale=2; ${size} / ${gb}")gb"
  elif [ $size -gt $mb ]; then
    echo "$(bc -l <<< "scale=2; ${size} / ${mb}")mb"
  elif [ $size -gt $kb ]; then
    echo "$(bc -l <<< "scale=2; ${size} / ${kb}")kb"
  else
    echo $size
  fi
}

function jannik() {
  open "http://www.google.com/search?q=$1"
}

function postjson() {
  curl -s -H "Content-Type: application/json" -X POST -d $2 $1 | lynx -dump -stdin
}
