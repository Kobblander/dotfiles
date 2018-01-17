#!/bin/bash

time=i`date '+%Y_%m_%d__%H_%M_%S'`
filename="appserror"
errorfile="$time-$filename.log"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


function checkIfError() {
    if [ $? -eq 0 ]; then
        echo -e "\t[${GREEN}✓${NC}] $1"
    else
        echo -e "\t[${RED}x${NC}] $1"
    fi
}

function addRepositories {
    echo "Adding repositories..."
    sudo add-apt-repository -y ppa:aguignard/ppa > /dev/null 2> $errorfile
    checkIfError "Adding qguignard repository..."

    # Neovim
    sudo add-apt-repository -y ppa:neovim-ppa/stable > /dev/null 2> $errorfile
    checkIfError "Adding neovim repositories..."

    # Spotify
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 > /dev/null 2> $errorfile
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null 2> $errorfile
    checkIfError "Adding spotify repositories..."

    # Chrome
    {
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-get-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    } > /dev/null 2> $errorfile
    checkIfError "Adding chrome repositories..."

    #Java
    sudo add-apt-repository -y ppa:webupd8team/java  > /dev/null 2> $errorfile
    checkIfError "Adding java repositories..."

}

function update {
    sudo apt-get -y --force-yes update > /dev/null 2> $errorfile
    checkIfError "Performing update..." > /dev/null 2> $errorfile
    sudo apt-get -y --force-yes dist-upgrade /vel/null 2> $errorfile
    checkIfError "Performing dist-upgrade"
}

function extra {
    echo "Performing extra..."

    sudo chsh $(which zsh)
    checkIfError "Changing shell to zsh..."
    xrdb ~/.Xresources
    checkIfError "Reloading .Xresources"
}

function install {
    echo "Installing packages from packages.txt.."
    while read p; do
	$(sudo apt-get -y install "$p") > /dev/null 2> $errorfile
	
	#$(sudo apt-get -y install $p)
	checkIfError "Installing $p..."
    done <packages.txt

    sudo pip  install --upgrade neovim
    checkIfError "Pip install --upgrade neovim..."
    sudo pip2 install --upgrade neovim
    checkIfError "Pip2 install --upgrade neovim..."
    sudo pip3 install --upgrade neovim
    checkIfError "Pip3 install --upgrade neovim..."

}

function clones {
    # Oh my zsh
    # Need to first install zsh
    # https://github.com/robbyrussell/oh-my-zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    checkIfError "Cloning oh my zsh"

    # Powerline fonts for zsh
    git clone https://github.com/powerline/fonts.git
    checkIfError "Cloning powerline fonts for zsh..."
    cd fonts
    ./install.sh
    checkIfError "Installing fonts for zsh..."
    cd ..
    rm -rf fonts
    checkIfError

    cp ".local/share/fonts/Source\ Code\ Pro\ for\ Powerline.otf ~/.fonts"
    sudo fc-cache -vf ~/.fonts
    checkIfError


    # Zsh powerline
    # git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git

    # powerlevel9k zsh theme
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    checkIfError"Cloning powerline9k zsh theme"

    # i3 gaps
    # Need to first install i3
    # https://github.com/Airblader/i3
    git clone https://github.com/Airblader/i3.git
    checkIfError "Cloning i3"

    git clone --branch 3.0.5 --recursive https://github.com/jaagr/polybar
    checkIfError
    mkdir polybar/build
    cd polybar/build
    cmake ..
    checkIfError
    sudo make install
    checkIfError

    git clone https://github.com/stark/siji && cd siji
    checkIfError
    ./install.sh
    checkIfError

    # i3lock-color
    git clone https://github.com/PandorasFox/i3lock-color/tree/dev
    cd i3lock-color
    autoreconf -i && ./configure && make
    sudo make install

    # Better lock screen, uses i3lock-color
    git clone https://github.com/pavanjadhaw/betterlockscreen
}

function configuration {
    # For neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    checkIfError
    sudo update-alternatives --config vi
    checkIfError
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    checkIfError
    sudo update-alternatives --config vim
    checkIfError
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    checkIfError
    sudo update-alternatives --config editor
    checkIfError

    # Work in progress
    cp .config ~/.config
}

#addRepositories
#
#update

install

#extra
#
#configuration


