# https://krew.sigs.k8s.io/ installed
if [[ -d "$HOME/.krew/bin" ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# find a better way to do that -> store in /usr/local/share/zsh/site-functions
if (( $+commands[kubectl-krew] )); then
  source <(kubectl krew completion zsh)
fi
