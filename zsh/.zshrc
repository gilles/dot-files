# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof
# source "$HOME/.zplug/init.zsh"

# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# #default from prezto
# zplug "modules/environment", from:prezto
# zplug "modules/editor", from:prezto
# zplug "modules/history", from:prezto
# zplug "modules/utility", from:prezto
# # better than the one in zsh-user
# zplug "modules/completion", from:prezto

# # prezto does not bring much more (but a few thing in the keymap, maybe just use prezto)
# ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern line root)
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-history-substring-search"

# # works with other things
# zplug "modules/tmux", from:prezto
# zplug "modules/ssh", from:prezto

# # languages
# # brings pyenv + autoswitch
# zplug "modules/python", from:prezto
# # nvm + autoswitch
# zplug "lukechilds/zsh-nvm"
# # export NVM_LAZY_LOAD=true
# export NVM_AUTO_USE=true
# export NVM_COMPLETION=true

# # sdkman completion, autoswitch is managed by sdkman itself
# zplug "plugins/sdk", from:oh-my-zsh
# # annoying that this is not in the plugin
# if [[ -f "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then
#     source "${HOME}/.sdkman/bin/sdkman-init.sh"
# fi

# zplug "romkatv/powerlevel10k", as:theme, depth:1

# zplug "$HOME/.zsh/plugins", from:local, as:plugin
# zplug "$HOME/.zsh/plugins/k8s", from:local, as:plugin

# # prezto config
# zstyle ':prezto:*:*' color 'yes'
# zstyle ':prezto:module:editor' key-bindings 'vi'
# zstyle ':prezto:module:tmux:auto-start' local 'yes'
# zstyle ':prezto:module:tmux:session' name 'default'
# zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'
# zstyle ':prezto:module:ssh:load' identities 'id_rsa'

__git_files () { 
    _wanted files expl 'local files' _files     
}

# # Install plugins if there are plugins that have not been installed
# # if ! zplug check --verbose; then
# #     printf "Install? [y/N]: "
# #     if read -q; then
# #         echo; zplug install
# #     fi
# # fi

# # Then, source plugins and add commands to $PATH
# zplug load

if [[ -s "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi

source "$HOME/.antidote/antidote.zsh"

# some setup
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets pattern line root)
NVM_LAZY_LOAD=true
NVM_AUTO_USE=true
NVM_COMPLETION=true

# prezto config
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:tmux:auto-start' local 'yes'
zstyle ':prezto:module:tmux:session' name 'default'
zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'
zstyle ':prezto:module:ssh:load' identities 'id_rsa'
# other config
export NVM_NO_USE=true

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
autoload -Uz promptinit && promptinit
antidote load

# annoying that this is not in the plugin
if [[ -f "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then
   source "${HOME}/.sdkman/bin/sdkman-init.sh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. Interestingly this is not sourced in the plugin
[[ ! -f ~/.p10k.zsh ]] || source "$HOME/.p10k.zsh"
