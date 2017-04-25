#!/bin/zsh

function addRepositories {
	echo "Adding repositories..."
	sudo add-apt-get-repository ppa:aguignard/ppa	

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
}

function install {
	echo "Performing installs..."
	sudo chsh $(which zsh)
	sudo apt-get -y install \
		git spotify-client virtualbox htop rxvt-unicode \
		zsh neovim\
		# start i3-gaps dependencies
		libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
		libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
		libstartup-notification0-dev libxcb-randr0-dev \
		libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
		libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev 
		autoconf libxcb-xrm0 libxcb-xrm-dev google-chrome-stable\
		#end i3-gaps dependencies
		libev-dev xclip curl\

}

function configuration {
	# Oh my zsh
	# Need to first install zsh
	# https://github.com/robbyrussell/oh-my-zsh
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

	# Zsh powerline
	git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git

	# i3 gaps
	# Need to first install i3
	# https://github.com/Airblader/i3
	git clone https://github.com/Airblader/i3.git
}

addRepositories





sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
