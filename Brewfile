# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install some other useful utilities like `sponge`
install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
install findutils
# Install GNU `sed`, overwriting the built-in `sed`
install gnu-sed --default-names
# Install Zsh
install zsh
install zsh-completions

install wget --enable-iri
install curl

# Install more recent versions of some OS X tools
install vim --override-system-vi
install homebrew/dupes/grep
install homebrew/dupes/screen

# Install other useful binaries
install ack
install git
install imagemagick --with-webp
install graphicsmagick
install tree
install htop-osx
install awscli
install jq
install watch

# Stuff I use in development
install memcached
install redis
install cassandra
install postgresql

install gradle
install maven
install maven-shell
install jenv

install python3

install checkstyle
install findbugs

install hub

# Remove outdated versions from the cellar
cleanup
