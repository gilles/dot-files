#
# Sorin prompt with some changes from me
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Screenshots:
#   http://i.imgur.com/nBEEZ.png
#

# Load dependencies.
pmodload 'helper'

function prompt_sorin_precmd {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS

  # Format PWD.

  # Get jenv information.
  if (( $+functions[java-info] )); then
    java-info
  fi

  # Get Git repository information.
  if (( $+functions[git-info] )); then
    git-info
  fi

  # Get Ruby info
  if (( $+functions[ruby-info] )); then
    ruby-info
  fi

  # Get Virtual env info
  if (( $+functions[python-info] )); then
    python-info
  fi

  # Get Node info
  if (( $+functions[node-info] )); then
    node-info
  fi
}

function prompt_sorin_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook

  # Add hook for calling git-info before each command.
  add-zsh-hook precmd prompt_sorin_precmd

  # Set editor-info parameters.
  zstyle ':prezto:module:editor:info:completing' format '%B%F{red}...%f%b'
  # zstyle ':prezto:module:editor:info:keymap:primary' format ' %B%F{red}❯%F{yellow}❯%F{green}❯%f%b'
  zstyle ':prezto:module:editor:info:keymap:primary' format '%B%F{red}$%f%b'
  zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format '%F{red}♺%f'
  zstyle ':prezto:module:editor:info:keymap:alternate' format '%B%F{green}❮%F{yellow}❮%F{red}❮%f%b'

  # Set git-info parameters.
  zstyle ':prezto:module:git:info' verbose 'yes'
  zstyle ':prezto:module:git:info:action' format ':%%B%F{yellow}%s%f%%b'
  zstyle ':prezto:module:git:info:added' format ' %%B%F{green}✚%f%%b'
  zstyle ':prezto:module:git:info:ahead' format ' %%B%F{yellow}⬆%f%%b'
  zstyle ':prezto:module:git:info:behind' format ' %%B%F{yellow}⬇%f%%b'
  zstyle ':prezto:module:git:info:branch' format ':%F{green}%b%f'
  zstyle ':prezto:module:git:info:commit' format ':%F{green}%.7c%f'
  zstyle ':prezto:module:git:info:deleted' format ' %%B%F{red}✖%f%%b'
  zstyle ':prezto:module:git:info:modified' format ' %%B%F{blue}✱%f%%b'
  zstyle ':prezto:module:git:info:position' format ':%F{red}%p%f'
  zstyle ':prezto:module:git:info:renamed' format ' %%B%F{magenta}➜%f%%b'
  zstyle ':prezto:module:git:info:stashed' format ' %%B%F{cyan}✭%f%%b'
  zstyle ':prezto:module:git:info:unmerged' format ' %%B%F{yellow}═%f%%b'
  zstyle ':prezto:module:git:info:untracked' format ' %%B%F{white}◼%f%%b'
  zstyle ':prezto:module:git:info:keys' format \
    'prompt' ' %F{blue}git%f$(coalesce "%b" "%p" "%c")%s' \
    'rprompt' '%A%B%S%a%d%m%r%U%u'

  # Set ruby-info parameters.
  zstyle ':prezto:module:ruby:info:version' format '%F{blue}rb:%v%f'

  # Set python-info parameters.
  zstyle ':prezto:module:python:info:virtualenv' format '%F{blue}py:%v%f'

  # Set node-info parameters
  zstyle ':prezto:module:node:info:version' format '%F{blue}node:%v%f'

  # Set java-info parameters.
  zstyle ':gilles:java:info:version' format '%F{blue}java:%v%f'

  # Define prompts.
  PROMPT='
%F{113}%n%f %F{cyan}%~%f ${java_info[version]} ${ruby_info[version]} ${node_info[version]} ${python_info[virtualenv]}
%(!.%B%F{red}#%f%b.)${editor_info[keymap]} '
  RPROMPT='${editor_info[overwrite]}%(?:: %F{red}⏎%f)${VIM:+" %B%F{green}V%f%b"}${git_info[rprompt]} ${git_info:+${(e)git_info[prompt]}}'
  SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
}

prompt_sorin_setup "$@"