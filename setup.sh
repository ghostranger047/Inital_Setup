common()
{
	
	## .bashrc edits
	printf "\n\n\n#Setup Script Edits\n">>"$HOME/.bashrc"
	printf "alias python=python3\n">>"$HOME/.bashrc"

	##Download/install XDM
	echo -n "Downloading XDM....."
	wget -O "xdm-setup-7.2.11.tar.xz" "https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz"
	tar xvf xdm-setup-7.2.11.tar.xz
	echo -n "Installing XDM"
	sudo ./install.sh

	##Java 15 setup
	printf "Downloading OpenJDK 15...."
	wget -O "openjdk-15.0.1_linux-x64_bin.tar.gz" "https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz"
	sudo tar xvf openjdk-15.0.1_linux-x64_bin.tar.gz -C /opt
	printf "export JAVA_HOME=/opt/jdk-15.0.1\n">>"$HOME/.bashrc"
	printf 'export PATH=${PATH}:${JAVA_HOME}/bin\n'>>"$HOME/.bashrc"
	
	
}

ubuntu()
{
	##Brave installation
	echo -n "Installing  Brave Browser Stable....."
	sudo apt install apt-transport-https curl gnupg
	curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
	echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser

	##Required
	echo -n "Installing build tools...."
	sudo apt install build-essential git wget


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




