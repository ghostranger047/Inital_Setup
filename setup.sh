common()
{
	
	## .bashrc edits
	printf "\n\n\n#Setup Script Edits\n">>"$HOME/.bashrc"
	printf "alias python=python3\n">>"$HOME/.bashrc"

	##Download/install XDM
	printf "\n\n\n\n\e[1;31mDownloading XDM.....\e[0m:\n"
	wget -O "xdm-setup-7.2.11.tar.xz" "https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz"
	tar xvf xdm-setup-7.2.11.tar.xz
	echo -n "Installing XDM"
	sudo ./install.sh
	printf "\e[1;42mDone\e[0m"

	##Java 15 setup
	printf "\n\n\n\n\e[1;31mDownloading OpenJDK 15....\e[0m:\n"
	wget -O "openjdk-15.0.1_linux-x64_bin.tar.gz" "https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz"
	sudo tar xvf openjdk-15.0.1_linux-x64_bin.tar.gz -C /opt
	printf "export JAVA_HOME=/opt/jdk-15.0.1\n">>"$HOME/.bashrc"
	printf 'export PATH=${PATH}:${JAVA_HOME}/bin\n'>>"$HOME/.bashrc"
	printf "\e[1;42mDone\e[0m"
	
	
}

ubuntu()
{
	##Sys upgrade
	printf "\e[1;31mPerforming system upgrade\e[0m:\n"
	sudo apt update
	sudo apt upgrade
	printf "\e[1;42mDone\e[0m"
	
	##Brave installation
	printf "\n\n\n\n\e[1;31mInstalling  Brave Browser Stable.....\e[0m:\n"
	sudo apt install -y apt-transport-https curl gnupg
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update -y
	sudo apt install -y brave-browser
	printf "\e[1;42mDone\e[0m"

	##Required
	printf "\n\n\n\n\e[1;31mInstalling build and tools....\e[0m:\n"
	sudo apt install -y build-essential git wget vim
	printf "\e[1;42mDone\e[0m"
	
	printf "\n\n\n\n\e[1;31mInstalling apps....\e[0m:\n"
	sudo apt install -y qbittorrent mpv
	printf "\e[1;42mDone\e[0m"

	##Utility Removal/installation:
	sudo apt remove -y firefox vlc


	##Autoremove
	printf "\n\n\e[1;31mCleaning installation\e[0m:\n"
	sudo apt autoremove -y
	printf "\e[1;42mDone.\e[0m"
}


arch()
{
	##Installing Brave(will work only on Manjaro based)
	printf "\n\n\e[1;31Installing Brave....:\e[0m\n"
	sudo pacman --noconfirm -Sy brave-browser
	printf "\e[1;42Done\e[0m"
}



echo -n "Enter group(ubuntu/arch)":
read SYS

if [[ $SYS == "ubuntu" ]]
	then
		echo "Ubuntu"
		ubuntu
		common
		source "$HOME/.bashrc"
	else
		echo "Arch"
		
fi
