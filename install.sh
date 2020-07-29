apt-get update 
apt install -y zsh
apt-get install -y stow

# symblink dotfiles to the home directory
stow ubuntu

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install z - jump around
git clone https://github.com/rupa/z.git ~/tools/z
# install zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
