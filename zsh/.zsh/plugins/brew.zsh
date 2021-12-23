# https://docs.brew.sh/Homebrew-on-Linux installed
if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
  source <(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if (( $+commands[brew] )); then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
