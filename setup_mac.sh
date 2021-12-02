HOSTNAME=$(basename $HOME)

function fn_echo(){
	echo "Installing/Setting up $1"
}

echo "Cloning dotfiles"

git clone https://github.com/Joe-a-d/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/.aliases ~/.aliases

# Homebrew

fn_echo "Homebrew"

/bin/bash -c "$(curl -fsSL \
 https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$HOSTNAME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Editors

fn_echo "Editors"

brew install macvim
brew install --cask sublime-text

# Terminal

fn_echo "oh-my-zsh"

sh -c "$(curl -fsSL \
	https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting

cd /Users/joe-a-d/Library/Application\ Support/iTerm2/DynamicProfiles/ 
ln -s ~/.dotfiles/iterm_profile.json iterm_profile.json
git clone https://github.com/powerline/fonts.git ~/.oh-my-zsh/fonts
./oh-my-zsh/fonts/install.sh # remember to select the profile in the GUI


# Utilities

fn_echo "Utilities"

brew install ffmpeg tree openssl exa cmake wget
brew install jq pandoc 
brew install postgresql
brew tap federico-terzi/espanso
brew install espanso
brew install yt-dlp/taps/yt-dlp

## TeX

brew install --cask mactex
cd ~/Library/
	ln -s ~/.dotfiles/Library/texmf texmf

# Languages

## python

fn_echo "Python stuff"

brew install python sphinx
# system-wide packages, if it grows freeze to requirements.txt
python -m install Sphinx virtualenv virtualenvwrapper pytest 
mkdir -p ~/dev/.venvs
virtualenv --system-site-packages ~/dev/.venvs/jupyter
source ~/devs/.vens/jupyter/bin/activate
python notebook





## haskell

fn_echo "Haskell stuff"
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

## java

fn_echo "Java stuff"

## js

fn_echo "JS stuff"

brew install npm
brew install yarn

## rust

fn_echo "Rust stuff"


# dotfiles

mkdir ~/dev



# macOS stuff

fn_echo "macOS stuff"

## trigger drag windows with cmd + ctrl

defaults write -g NSWindowShouldDragOnGesture -bool true

## setup daemon to swap esc, caps
AGENTS_PATH="$HOME/Library/LaunchAgents/"
if [ ! -d $AGENTS_PATH ]; then mkdir $AGENTS_PATH; fi
cp ~/.dotfiles/com.local.KeyRemapping.plist $AGENTS_PATH/com.local.KeyRemapping.plist


# vim shennanigans

vim_plug.sh