### start glovali_config
alias i3statusrebuild="cat ~/.config/glovali_config/i3status/include/*.conf > ~/.config/i3status/config"
alias comptonrebuild="cat ~/.config/glovali_config/compton/compton.conf > ~/.config/compton.conf"
alias i3rebuild="i3statusrebuild && comptonrebuild && cat ~/.config/glovali_config/i3/include/*.conf > ~/.config/i3/config"
### end glovali_config
