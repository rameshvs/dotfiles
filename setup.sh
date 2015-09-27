#!/usr/bin/env zsh

### Set up zsh (prezto)
git clone --recursive https://github.com/rameshvs/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

### Set up vim
git clone --recursive http://github.com/rameshvs/dotvim $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
touch $HOME/.vim/viminfo
ln -s $HOME/.vim/viminfo $HOME/.viminfo

### set up other stuff
cp tmux.conf $HOME/.tmux.conf
