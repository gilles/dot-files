#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export WORKON_HOME=~/.virtualenvs/
export EDITOR='vim'
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

json() {
  jq '.'
}

setopt no_share_history

if [[ -s "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
