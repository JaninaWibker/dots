#!/bin/sh

# For ARM use this instead
# https://gist.github.com/ruario/19a28d98d29d34ec9b184c42e5f8bf29

available () {
  command -v "$1" >/dev/null 2>&1
}

# Make sure we have wget or curl
if available wget; then
  DL="wget"
  DL_SILENT="wget -qO-"
elif available curl; then
  DL="curl -LO"
  DL_SILENT="curl -s"
else
  echo "Install wget or curl" >&2
  exit 1
fi

# Use the architecture of the current machine or whatever the user has set
# externally
ARCH="${ARCH:-$(uname -m)}"
case "$ARCH" in
  x86_64) WIDEVINE_ARCH="x64"; CHROMIUM_ARCH="x64" ;;
    i?86) WIDEVINE_ARCH="ia32"; CHROMIUM_ARCH="x86" ;;
    arm*) echo "For ARM use https://gist.github.com/ruario/19a28d98d29d34ec9b184c42e5f8bf29 instead" >&2 ; exit 1 ;;
       *) echo "The architecture $ARCH is not supported." >&2 ; exit 1 ;;
esac

# Set Output dir
WIDEVINE_INSTALL_DIR="${WIDEVINE_INSTALL_DIR:-/opt/google/chrome/WidevineCdm/_platform_specific/linux_$CHROMIUM_ARCH}"

# Set temp dir
TMP="${TMP:-/tmp}"

# Set staging dir
STAGINGDIR="$TMP/widevine-staging"

# Work out the latest Widevine version
WIDEVINE_VERSION="${WIDEVINE_VERSION:-$($DL_SILENT https://dl.google.com/widevine-cdm/versions.txt | tail -n1)}"

# Error out if $CDMVERISON is unset, e.g. because previous command failed
if [ -z "$WIDEVINE_VERSION" ]; then
  echo "Could not work out the latest version; exiting" >&2
  exit 1
fi

# Don't start repackaging if the same version is already installed
if [ -e "$WIDEVINE_INSTALL_DIR/widevine-$WIDEVINE_VERSION" ] ; then
  echo "The latest Widevine ($WIDEVINE_VERSION) is already installed"
  exit 0
fi

# If the staging directory is already present from the past, clear it down and
# re-create it.
if [ -d "$STAGINGDIR" ]; then
  rm -fr "$STAGINGDIR"
fi

# Stop on any error
set -eu

# Make and switch to the staging directory
mkdir -p "$STAGINGDIR"
cd "$STAGINGDIR"

# Now get the latest widevine zip for the users architecture
$DL "https://dl.google.com/widevine-cdm/${WIDEVINE_VERSION}-linux-${WIDEVINE_ARCH}.zip"

# Extract the contents of Widevine package
if available unzip; then
  unzip -qq "${WIDEVINE_VERSION}-linux-${WIDEVINE_ARCH}.zip"
elif available bsdtar; then
  bsdtar xf "${WIDEVINE_VERSION}-linux-${WIDEVINE_ARCH}.zip"
elif available python && python -m zipfile -c /dev/null '*NOMATCH*' >/dev/null 2>&1; then
  python -m zipfile -e "${WIDEVINE_VERSION}-linux-${WIDEVINE_ARCH}.zip" .
else
  # The user's system has no obvious handler for Zip files. GZip can extract
  # the first entry from a Zip. If libwidevinecdm.so is the first entry, we
  # might just pull this off! ;)
  missing_extractor_error () {
    echo "Install InfoZip Unzip or BSD tar" >&2
    exit 1
  }
  # Look in first 50 bytes for libwidevinecdm.so as it'll be mentioned there
  # if it is the first entry in the zip
  if head -c50 "${WIDEVINE_VERSION}-linux-${WIDEVINE_ARCH}.zip" | grep -Fq libwidevinecdm.so; then
    # Hide the warning about multiple entries and ensure an exit code of 0
    gzip -d < "${WIDEVINE_VERSION}-linux-${WIDEVINE_ARCH}.zip" > libwidevinecdm.so 2> /dev/null ||:
    # Check that it looks like an executable
    if ! file libwidevinecdm.so | grep -Fq ELF; then
      missing_extractor_error
    fi
  else
    missing_extractor_error
  fi
fi

# Add version number file
touch "widevine-$WIDEVINE_VERSION"

# Escalate privileges if needed and copy files into place
if [ "$USER" = "root" ]; then
  install -Dm644 libwidevinecdm.so "$WIDEVINE_INSTALL_DIR/libwidevinecdm.so"
  install -Dm644 "widevine-$WIDEVINE_VERSION" "$WIDEVINE_INSTALL_DIR/widevine-$WIDEVINE_VERSION"
elif [ -r /etc/os-release ] && grep -qx 'ID=ubuntu' /etc/os-release; then
  echo "Calling sudo ... If prompted, please enter your password so Widevine can be copied into place"
  sudo install -Dm644 libwidevinecdm.so "$WIDEVINE_INSTALL_DIR/libwidevinecdm.so"
  if [ -e "$WIDEVINE_INSTALL_DIR/libwidevinecdm.so" ]; then
    sudo install -Dm644 "widevine-$WIDEVINE_VERSION" "$WIDEVINE_INSTALL_DIR/widevine-$WIDEVINE_VERSION"
  else
    echo "Something went wrong installing libwidevinecdm.so" >&2
    exit 1
  fi
else
  echo "Please enter your root password so Widevine can be copied into place"
  su -c "sh -c \"install -Dm644 libwidevinecdm.so $WIDEVINE_INSTALL_DIR/libwidevinecdm.so && install -Dm644 widevine-$WIDEVINE_VERSION $WIDEVINE_INSTALL_DIR/widevine-$WIDEVINE_VERSION\""
fi

# Tell the user we are done
echo "Widevine ($WIDEVINE_VERSION) installed into $WIDEVINE_INSTALL_DIR"
