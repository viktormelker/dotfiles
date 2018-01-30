# Setup file for mac

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# update locate db
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Install python, pip
brew install python
brew install python3

# install fish shell
brew install fish

# install tools
brew install htop
brew install ctop
brew install httpie
brew install ripgrep
brew install caskroom/cask/google-cloud-sdk
brew install kubectl
brew install node
brew install diff-so-fancy

# pip
sudo easy_install pip

# telepresence
brew cask install osxfuse
brew install socat datawire/blackbird/telepresence

# fyndiq new platform stuff
brew install librdkafka
brew install kafkacat

