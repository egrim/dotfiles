PATH=$(path_remove ~/bin):~/bin
PATH=$(path_remove ~/opt/google_appengine):~/opt/google_appengine
PATH=$(path_remove ~/android-sdks/platform-tools):~/android-sdks/platform-tools
PATH=$(path_remove /usr/local/sbin):/usr/local/sbin
PATH=$(path_remove /usr/local/heroku/bin):/usr/local/heroku/bin
PATH=$(path_remove $HOME/.rvm/bin):$HOME/.rvm/bin
PATH=$(path_remove $(npm -g bin 2> /dev/null)):$(npm -g bin 2> /dev/null)

export PATH
