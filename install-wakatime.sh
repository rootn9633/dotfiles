#!/bin/bash
! type pip3 &> /dev/null && sudo apt install python3-pip -y 
pip3 install wakatime
[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/wakatime ] && git clone https://github.com/sobolevn/wakatime-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/wakatime
read -p "wakatime key: " wakatime_key
cat >> $HOME/.wakatime.cfg << EOF
[settings]
api_key = $wakatime_key
EOF
