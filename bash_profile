
export PATH=.:~/bin:/opt/local/bin:/opt/local/sbin:$PATH

export RUBYOPT=rubygems

alias ls='ls -G'
alias ll='ls -l'

source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

__hg_ps1() {
  hg prompt " ({[+{incoming|count}]-->}{patch}|{branch}{-->[+{outgoing|count}]}{status})" 2> /dev/null
}

if [ -e /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
  source ~/.bash/completions
fi

export PS1="[\D{%Y-%m-%d} \t] \e[1;35m\]\w\e[0m\] \e[1;36m\](\$(rvm-prompt i v g))\e[0m\]\$(__git_ps1)\$(__hg_ps1)\n$ "

