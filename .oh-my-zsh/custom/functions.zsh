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

if [[ $OSTYPE == darwin* ]]; then
  function spotify_now_playing() {
    osascript -e "display notification \"$(spotify info song)\" with title \"$(spotify info state) Spotify - $(spotify info time)\""
  }
fi

function colortest() {
  bash $ZSH/custom/scripts/colortest.sh
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
