# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew casks need Homebrew to install." && return 1

# Ensure the cask kegs are installed.
kegs=(
  caskroom/cask
  caskroom/drivers
  caskroom/fonts
)
brew_tap_kegs

# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Homebrew casks
casks=(
  # Applications
  a-better-finder-rename
  #alfred
  android-platform-tools
  android-studio
  anylist
  arduino
  aws-vault
  #bartender
  #bettertouchtool
  calibre
  charles
  #chromium
  #chronosync
  #controllermate
  diffmerge
  disk-inventory-x
  docker
  dozer # hide menu bar cruft
  dropbox
  evernote
  #fastscripts
  #firefox
  gimp
  #google-backup-and-sync # already installed by IT
  gpg-suite
  #gyazo # instant screenshots
  hex-fiend
  #iterm2
  xquartz # must be before inkscape
  inkscape
  karabiner-elements
  launchcontrol
  macdown
  #messenger-for-desktop
  #midi-monitor
  #moom # window manager
  omnidisksweeper
  pycharm
  quip
  #reaper #digital audio workstation
  reflector
  #robo-3t #mogodb gui
  #screenhero
  #scroll-reverser
  slack
  slate
  sonos
  sourcetree
  spotify
  the-unarchiver
  #totalfinder
  #tower
  #vagrant
  #virtualbox
  vlc
  wireshark
  #ynab
  
  # Quick Look plugins
  # betterzipql
  qlcolorcode
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  quicknfo
  suspicious-package
  # webpquicklook
  # Color pickers
  colorpicker-developer
  colorpicker-skalacolor
  # Fonts
  font-m-plus
  font-mplus-nerd-font
  font-mplus-nerd-font-mono
)

# Install Homebrew casks.
casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0 )); then
  e_header "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install $cask
  done
fi

# Work around colorPicker symlink issue.
# https://github.com/caskroom/homebrew-cask/issues/7004
cps=()
for f in ~/Library/ColorPickers/*.colorPicker; do
  [[ -L "$f" ]] && cps=("${cps[@]}" "$f")
done

if (( ${#cps[@]} > 0 )); then
  e_header "Fixing colorPicker symlinks"
  for f in "${cps[@]}"; do
    target="$(readlink "$f")"
    e_arrow "$(basename "$f")"
    rm "$f"
    cp -R "$target" ~/Library/ColorPickers/
  done
fi
