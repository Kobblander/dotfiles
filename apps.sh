#!/bin/zsh

function addRepositories {
    echo "Adding repositories..."
    sudo add-apt-repository ppa:aguignard/ppa

    # Neovim
    echo "Adding neovim repository..."
    sudo add-apt-get-repository ppa:neovim-ppa/stable

    # Spotify
    echo "Adding spotify key..."
    sudo apt-get-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt-get/sources.list.d/spotify.list

    # Chrome
    echo "Adding chrome key..."
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-get-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt-get/sources.list.d/google.list'




}

function update {
    echo "Performing update..."
    sudo apt-get -y --force-yes update
    echo "Performing dist-upgrade..."
    sudo apt-get -y --force-yes dist-upgrade
}

function extra {
    echo "Changing shell to zsh..."
    sudo chsh $(which zsh)
    echo "Reloading .Xresources"
    xrdb ~/.Xresources
}

function install {
    echo "Performing installs..."

    sudo apt-get -y install \
        git spotify-client virtualbox htop rxvt-unicode \
        zsh neovim\
        # start i3-gaps dependencies
        libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
        libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
        libstartup-notification0-dev libxcb-randr0-dev \
        libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
        libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
        autoconf libxcb-xrm0 libxcb-xrm-dev google-chrome-stable \
        #end i3-gaps dependencies
        libev-dev xclip curl software-properties-common \
        python-dev python-pip python3-dev python3-pip

    sudo pip  install --upgrade neovim
    sudo pip2 install --upgrade neovim
    sudo pip3 install --upgrade neovim

}

function clones {
    # Oh my zsh
    # Need to first install zsh
    # https://github.com/robbyrussell/oh-my-zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    # Powerline fonts for zsh
    git clone https://github.com/powerline/fonts.git
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts

    cp ".local/share/fonts/Source\ Code\ Pro\ for\ Powerline.otf ~/.fonts"
    sudo fc-cache -vf ~/.fonts


    # Zsh powerline
    # git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git

    # powerlevel9k zsh theme
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

    # i3 gaps
    # Need to first install i3
    # https://github.com/Airblader/i3
    git clone https://github.com/Airblader/i3.git
}

function configuration {
    # For neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor

    # Work in progress
    cp .config ~/.config
}

addRepositories





