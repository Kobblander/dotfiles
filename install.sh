#!/bin/zsh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks for the scripts
sudo ln -sfv $DIR/scripts/* /usr/local/bin

# Clean stock i3 configs
rm -rf ~/.i3
rm -rf ~/.config/i3

# Create symlink to my i3 config
ln -sfv $DIR/i3 ~/.config/
ln -sfv $DIR/i3status ~/.config/
ln -sfv $DIR/polybar ~/.config/

ln -sfv $DIR/.zshrc ~/
ln -sfv $DIR/.aliases ~/
ln -sfv $DIR/.Xresources ~/
