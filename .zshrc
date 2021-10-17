# Golang configuration
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
gvm use go1.6

# Python configuration
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
pyenv global 3.9.7

# Nodejs configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm use v14.18.1

# Sdkman configuration
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Java configuration
export JAVA_HOME="define here!"

# Good
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
alias ls='ls --color=auto'
clear && neofetch