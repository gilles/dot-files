#!/bin/bash

#background
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color '#000000'
gsettings set org.gnome.desktop.background secondary-color '#5789ca'

#media keys
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down '<Alt><Super>Delete'
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up '<Alt><Super>Insert'
gsettings set org.gnome.settings-daemon.plugins.media-keys previous '<<Alt><Super>Page_Up'
gsettings set org.gnome.settings-daemon.plugins.media-keys next '<Alt><Super>Page_Down'
gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute '<Alt><Super>End'
# this does play/pause
gsettings set org.gnome.settings-daemon.plugins.media-keys play '<Alt><Super>Home'

# packages
# sudo apt update
apt_packages=(
    gnome-tweaks
    gnome-shell-extensions
    chrome-gnome-shell 
    neovim 
    gawk
    xsel
    zsh
    wget
    curl
    apt-transport-https
    ca-certificates
    gnupg-agent
    software-properties-common
    tmux
    telnet
    python3-venv
    pipx
    maven
    gir1.2-gtop-2.0 
    gir1.2-nm-1.0 
    gir1.2-clutter-1.0
    fzf
    stow)
sudo apt install -y ${apt_packages[@]}

# snaps
sudo snap install code --classic
sudo snap install intellij-idea-community --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install spotify
sudo snap install zoom-client
sudo snap install skype --classic

# chrome
curl -o chrome.deb -J -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./chrome.deb
rm -rf ./chrome.deb

# wavebox
curl -o wavebox.deb -J -L https://download.wavebox.app/latest/stable/linux/deb
sudo apt install ./wavebox.deb
rm -rf ./wavebox.deb

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# coretto
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
sudo apt update 
sudo apt install -y java-11-amazon-corretto-jdk

#jenv
git clone https://github.com/jenv/jenv.git ~/.jenv
#virtualenv
pipx install virtualenv
# nvm, no "latest"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# Google cloud SDK
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-326.0.0-linux-x86_64.tar.gz
tar xzvf google-cloud-sdk-326.0.0-linux-x86_64.tar.gz -C $HOME
rm -rf google-cloud-sdk-326.0.0-linux-x86_64.tar.gz

#zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

#tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# stow config files
stow zsh
stow tmux
stow git
stow curl
stow wget
stow -t $HOME/.config/nvim nvim 

# init commands, should work (maybe)
zsh -c 'zplug install'
vim +PluginInstall +all
tmux run-shell "$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"

jenv add /usr/lib/jvm/java-11-amazon-coretto/
jenv global 11
jenv enable-plugin maven
jenv enable-plugin export

# set zsh as the default
chsh -s $(which zsh)

# logout and relogin to pick up changes
# extensions
# don't now how to enable them automatically but probably through 
# `gnome-extensions` https://wiki.gnome.org/Projects/GnomeShell/Extensions
# https://extensions.gnome.org/extension/779/clipboard-indicator/
# https://extensions.gnome.org/extension/906/sound-output-device-chooser/
# https://extensions.gnome.org/extension/120/system-monitor/
# https://extensions.gnome.org/extension/19/user-themes/
