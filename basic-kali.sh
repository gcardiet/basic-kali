#!/bin/bash

### variables for cosmetic

fgRed=$'\e[1;31m'
fgGreen=$'\e[1;32m'
fgYellow=$'\e[1;33m'
fgBlue=$'\e[1;34m'
fgMagenta=$'\e[1;35m'
fgCyan=$'\e[1;36m'
fgEnd=$'\e[0m'


### checking for git and offering to install if necessary

printf "\nThis script downloads tools from github into the /opt folder.\n"

function check_git() {
	printf "Checking for git...\n"

	if hash git 2>/dev/null;
		then
		printf "${fgGreen}git is installed, continuing script...${fgEnd}\n\n"
		### here call to function to download the git repos
	else
		printf "${fgRed}I require \"git\" but it\'s not installed. Would you like to install it now?${fgEnd} (y/n) "
		read install_git;

		if [ "$install_git" == "y" ];
			then
			printf "The following command is being run: ${fgBlue}sudo apt update && sudo apt install git -y${fgEnd}\n"
			printf "Would you like to continue? (y/n) "
			read confirm_git_install;

			if [ "$confirm_git_install" == "y" ];
				then
				printf "${fgGreen}Installing git as sudo.${fgEnd}\n"
				sudo apt update && sudo apt install git -y

				check_git
			else
				printf "${fgRed}git is required to continue, exiting script!${fgEnd}\n"
				exit
			fi
		else
			printf "${fgRed}Exiting script!${fgEnd}\n"
			exit
		fi

	fi
}

check_git

### cd into /opt to have the repos in a propper place
cd /opt

git_enum=("https://github.com/DominicBreuker/pspy.git" #for compiled version https://github.com/DominicBreuker/pspy/releases/download/v1.0.0/pspy64
            "https://github.com/rebootuser/LinEnum.git"
            "https://github.com/sleventyeleven/linuxprivchecker.git"
            "https://github.com/pentestmonkey/unix-privesc-check.git"
            "https://github.com/diego-treitos/linux-smart-enumeration.git"
            "https://github.com/mzet-/linux-exploit-suggester.git"
            "https://github.com/rasta-mouse/Sherlock.git"
            "https://github.com/guelfoweb/knock.git"
            "https://github.com/aboul3la/Sublist3r.git"
            )

git_hash=("https://github.com/magnumripper/JohnTheRipper.git"
            "https://github.com/hashcat/hashcat.git"
            "https://github.com/gentilkiwi/mimikatz.git"
            "https://github.com/digininja/CeWL.git"
            )

git_network=("https://github.com/SecureAuthCorp/impacket.git"
                "https://github.com/jpillora/chisel.git"
                "https://github.com/samratashok/nishang.git"
                "https://github.com/besimorhino/powercat.git"
                )

git_other=("https://github.com/ohpe/juicy-potato.git"
            "https://github.com/danielbohannon/Invoke-Obfuscation.git"
            "https://github.com/swisskyrepo/PayloadsAllTheThings.git"
            "https://github.com/danielmiessler/SecLists.git"
            "https://github.com/gchq/CyberChef.git"
    	    "https://github.com/s0md3v/Striker.git"
            )

### Enum tools for different uses
### counter fo cosmetics
counter=1

printf "${fgBlue}Getting Enumeration Tools${fgEnd}\n"
for i in "${git_enum[@]}";
	do
	printf "${fgMagenta}cloning repo %s out of total %s${fgEnd}\n" $counter "${#git_enum[@]}"
    printf "${fgYellow}%s${fgEnd}\n" $i
	git clone $i
	counter=$[counter +1]
	echo
done

### tools for hashes, cracking, etc.
### reset counter
counter=1

printf "\n${fgBlue}Getting Tools related to Hashes${fgEnd}\n"
for i in "${git_hash[@]}";
	do
	printf "${fgMagenta}cloning repo %s out of total %s${fgEnd}\n" $counter "${#git_hash[@]}"
    printf "${fgYellow}%s${fgEnd}\n" $i
	git clone $i
	counter=$[counter +1]
	echo
done

### tools for network related stuff
### reset counter
counter=1

printf "\n${fgBlue}Getting Network related stuff${fgEnd}\n"
for i in "${git_network[@]}";
	do
	printf "${fgMagenta}cloning repo %s out of total %s${fgEnd}\n" $counter "${#git_network[@]}"
    printf "${fgYellow}%s${fgEnd}\n" $i
	git clone $i
	counter=$[counter +1]
	echo
done

### tools for different things
### reset counter
counter=1

printf "\n${fgBlue}Getting other Tools${fgEnd}\n"
for i in "${git_other[@]}";
	do
	printf "${fgMagenta}cloning repo %s out of total %s${fgEnd}\n" $counter "${#git_other[@]}"
    printf "${fgYellow}%s${fgEnd}\n" $i
	git clone $i
	counter=$[counter +1]
	echo
done

printf "END\n"
