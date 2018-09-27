if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi
