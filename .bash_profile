source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

