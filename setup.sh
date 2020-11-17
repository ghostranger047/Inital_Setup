common()
{
	
	## .bashrc edits
	printf "\n\n\n#Setup Script Edits\n">>"$HOME/.bashrc"
	printf "alias python=python3\n">>"$HOME/.bashrc"

	##Download/install XDM
	echo -n "\n\n\n\n\e[1;31m Downloading XDM.....\e[0m\n"
	wget -O "xdm-setup-7.2.11.tar.xz" "https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz"
	tar xvf xdm-setup-7.2.11.tar.xz
	echo -n "Installing XDM"
	sudo ./install.sh

	##Java 15 setup
	printf "\n\n\n\n\e[1;31m Downloading OpenJDK 15....\e[0m\n"
	wget -O "openjdk-15.0.1_linux-x64_bin.tar.gz" "https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz"
	sudo tar xvf openjdk-15.0.1_linux-x64_bin.tar.gz -C /opt
	printf "export JAVA_HOME=/opt/jdk-15.0.1\n">>"$HOME/.bashrc"
	printf 'export PATH=${PATH}:${JAVA_HOME}/bin\n'>>"$HOME/.bashrc"
	
	
}

ubuntu()
{
	##Sys upgrade
	printf "\e[1;31m Performing system upgrade\e[0m\n"
	sudo apt update > /dev/null 2>&1
	sudo apt -y upgrade > /dev/null 2>&1
	printf "Done"
	
	##Brave installation
	printf "\n\n\n\n\e[1;31m Installing  Brave Browser Stable.....\e[0m\n"
	sudo apt install apt-transport-https curl gnupg
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt -y update > /dev/null 2>&1
	sudo apt -y install brave-browser > /dev/null 2>&1
	printf "Done"

	##Required
	printf "\n\n\n\n\e[1;31m Installing build and tools....\e[0m\n"
	sudo apt -y install build-essential git wget vim > /dev/null 2>&1
	printf "Done"

	##Utility
	sudo apt -y revome vlc firefox
	sudo apt install mpv


	##
	printf "\n\n\n\n\e[1;31mCleaning installation\e[0m"
	sudo apt -y autoremove /dev/null 2>&1
	printf "Done

}


arch()
{
	printf "Ok"
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
		common
fi
