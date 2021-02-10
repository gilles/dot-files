source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/git", from:prezto
zplug "modules/ruby", from:prezto
zplug "modules/python", from:prezto
zplug "lukechilds/zsh-nvm"
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "matthieusb/zsh-sdkman"
# zplug "kiurchv/asdf.plugin.zsh"
zplug "modules/tmux", from:prezto
zplug "modules/ssh", from:prezto
zplug "~/.zsh/plugins", from:local, as:plugin
zplug "~/.zsh/plugins/k8s", from:local, as:plugin
zplug "~/.zsh/themes", from:local, as:theme


# prezto config
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:session' name 'default'
zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'
zstyle ':prezto:module:ssh:load' identities 'id_rsa'

zstyle ':prezto:module:syntax-highlighting' highlighters \
   'main' \
   'brackets' \
   'pattern' \
   'line' \
   'root'

__git_files () { 
    _wanted files expl 'local files' _files     
}

# some other config
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load

#for some reason these don't work
# plugin is loaded, path are added but completion don't work
source "$HOME/google-cloud-sdk/completion.zsh.inc"

if [[ -s "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi
