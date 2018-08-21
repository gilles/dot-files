#
# Stolen from zprezto. Only set the options here so zplug can
# keep zsh-syntax-highlighting up to date.
#
# Integrates zsh-syntax-highlighting into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if ! zstyle -t ':prezto:module:syntax-highlighting' color; then
  return 1
fi

# Set highlighters.
zstyle -a ':prezto:module:syntax-highlighting' highlighters 'ZSH_HIGHLIGHT_HIGHLIGHTERS'
if (( ${#ZSH_HIGHLIGHT_HIGHLIGHTERS[@]} == 0 )); then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
fi

# Set highlighting styles.
typeset -A syntax_highlighting_styles
zstyle -a ':prezto:module:syntax-highlighting' styles 'syntax_highlighting_styles'
for syntax_highlighting_style in "${(k)syntax_highlighting_styles[@]}"; do
  ZSH_HIGHLIGHT_STYLES[$syntax_highlighting_style]="$syntax_highlighting_styles[$syntax_highlighting_style]"
done
unset syntax_highlighting_style{s,}

# Set pattern highlighting styles.
typeset -A syntax_pattern_styles
zstyle -a ':prezto:module:syntax-highlighting' pattern 'syntax_pattern_styles'
for syntax_pattern_style in "${(k)syntax_pattern_styles[@]}"; do
  ZSH_HIGHLIGHT_PATTERNS[$syntax_pattern_style]="$syntax_pattern_styles[$syntax_pattern_style]"
done
unset syntax_pattern_style{s,}