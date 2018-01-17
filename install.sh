#!/bin/zsh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

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
ln -sfv $DIR/.zsh_aliases ~/
ln -sfv $DIR/.Xresources ~/

sudo mkdir /mnt/staging

#sudo sshfs -o allow_other,defer_permissions jakobat@act-staging-01:/ /mnt/staging
