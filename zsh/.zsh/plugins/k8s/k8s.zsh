# k8s (kubectl installed as part of Google Cloud SDK)
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi

# kube context switcher (copied locally, find a way to keep up to date)
if [[ -d "$HOME/.zsh/plugins/k8s" ]]; then
  export PATH="$PATH:$HOME/.zsh/plugins/k8s/bin"
  fpath=($HOME/.zsh/plugins/k8s/completions $fpath)
fi
