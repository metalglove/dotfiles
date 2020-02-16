#!/bin/bash

# script to setup the glovali_config
echo 'Started glovali_config setup!'

function exists() 
{
	return $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") 
}

function install_app()
{
	for i; 
	do
		if exists $i; then
			echo "$i is not installed!"
			read -s -n1 -p "Would you like to install $i? [y/n]" yesno;
			# echo new line
			echo ""
			if [[ "$yesno" = "y" || "$yesno" = "Y" ]]; then
				#app-get install $i
				echo "Installing $i"
			else
				echo "Aborting."
				exit 1;
			fi
		else	
			echo "$i is present"
		fi;
	done
}

echo "Checking if required packages are installed..."
# check for installed i3-gaps, i3status, i3fancy-lock, compton, alacritty, nitrogen
# actual apps blueman, jetbrains-toolbox, spotify, google-chrome, discord, gitkraken, mailspring
install_app i3-gaps i3status i3lock-fancy compton alacritty nitrogen

# Check if the aliases are set up
function append_aliases()
{
	echo ". ~/.config/glovali_config/aliases.sh" > ~/.bash_aliases
	echo 'Appended aliases!'
}

if [ -f ~/.bash_aliases ]; then
	if ! grep -q ". ~/.config/glovali_config/aliases.sh" ~/.bash_aliases; then
		append_aliases
	else
		echo 'Aliases already exist'
	fi
else
	echo '~/.bash_aliases does not exist.'
	echo 'Created ~/.bash_aliases'
	append_aliases
fi

echo 'Completed setup!'

