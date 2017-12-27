export PATH="$HOME/.local/bin:$HOME/Library/Haskell/bin:$HOME/.rvm/bin:/usr/local/opt/llvm/bin:$PATH"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

alias tmux='tmux -2'
if [ "$TERM" != "xterm-256color" ]; then
  export TERM=xterm-256color
fi
export EDITOR='vim'

# export HTTP_PROXY="http://localhost:1080"
# export HTTPS_PROXY="http://localhost:1080"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
