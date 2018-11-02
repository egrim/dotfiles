export PATH

if [[ -e /etc/profile.d/rvm.sh ]]; then
  # rvm init
  source /etc/profile.d/rvm.sh
else
  # rbenv init.
  if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
    eval "$(rbenv init -)"
  fi
fi
