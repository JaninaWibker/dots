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

function colortest() {
  bash $ZSH/custom/scripts/colortest.sh
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
