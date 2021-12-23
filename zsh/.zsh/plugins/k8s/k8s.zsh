# find a better way to do that -> store in /usr/local/share/zsh/site-functions
# k8s (kubectl installed as part of Google Cloud SDK)
if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi
