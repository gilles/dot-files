# k8s (kubectl installed as part of Google Cloud SDK)
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi

# kube context switcher (copied locally, find a way to keep up to date)
if [[ -d "$HOME/.dot-files/zsh/k8s" ]]; then
  export PATH="$PATH:$HOME/.dot-files/zsh/k8s/bin"
  fpath=($HOME/.dot-files/zsh/k8s/completions $fpath)
fi
