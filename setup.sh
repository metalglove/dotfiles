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
				echo "Installing $i..."
				app-get install $i
				echo "Installed $i!"
			else
				echo "Aborting."
				exit 1;
			fi
		else	
			echo "$i is present"
		fi;
	done
}

# TODO: custom dunst config?
echo "Checking if required packages are installed..."
# Check for installed i3-gaps, i3status, i3fancy-lock, compton, alacritty, nitrogen, dunst
# Actual apps that I run are blueman, jetbrains-toolbox, visual studio code, spotify, google-chrome, discord, gitkraken, mailspring, pavucontrol
install_app i3-gaps i3status i3lock-fancy compton alacritty nitrogen dunst

function append_aliases()
{
	echo ". ~/.config/glovali_config/aliases.sh" > ~/.bash_aliases
	echo 'Appended aliases!'
}

# Check if the aliases are set up
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
