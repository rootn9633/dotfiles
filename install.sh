#!/bin/sh
sudo apt-get update

# symblink dotfiles to the home directory
sudo apt-get install -y stow
stow ubuntu

# Change default shell to zsh
echo "\nInstalling zsh..."
sudo apt install -y zsh
[ $SHELL != $(which zsh) ] && chsh -s $(which zsh) || echo "(skipped) default shell is already zsh"

# install oh-my-zsh
echo "\nInstalling oh-my-zsh..."
[ ! -d "$HOME/.oh-my-zsh" ] && {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # install zsh-autosuggestion
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
} || echo "(skipped) oh my zsh was previously installed"

# install z - jump around
echo "\nInstalling z..."
[ ! -d "$HOME/tools/z" ] && git clone https://github.com/rupa/z.git $HOME/tools/z || echo "(skipped) z - jump around was previously installed"

# install base16 color scheme
echo "\nInstalling base16..."
[ ! -d "$HOME/.config/base16-shell" ] && {
    git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell
    cat ~/.zshrc << EOF
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"
    . $HOME/.zshrc
    base16_materia
EOF
} || echo "(skipped) base16 was previously installed"
