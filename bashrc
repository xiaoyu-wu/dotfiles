# Git auto completion (not working for now)
source ~/.git-completion.bash

# Constants
export ETS_TOOLKIT=qt4
export VISUAL=vim
export EDITOR="$VISUAL"

# Credentials
source ~/.hatcher_credentials

# Prompt
# BGREEN='\[\033[1;32m\]'
# GREEN='\[\033[0;32m\]'
# BRED='\[\033[1;31m\]'
# RED='\[\033[0;31m\]'
# BBLUE='\[\033[1;34m\]'
# BLUE='\[\033[0;34m\]'
# NORMAL='\[\033[00m\]'
# export PS1="${BLUE}(${GREEN}\w${BLUE}) ${NORMAL}\h ${GREEN}\$ ${NORMAL}"
. ~/.bash_prompt

export TERM=xterm-256color

# Alias
alias ll="ls -alG"

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi


