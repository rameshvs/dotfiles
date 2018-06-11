#!/usr/bin/env zsh

### Set up zsh (prezto)
git clone --recursive https://github.com/rameshvs/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

### Make a local folder and populate with useful scripts
mkdir -p $HOME/.local/bin
curl -o $HOME/.local/bin/imgls https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgls
curl -o $HOME/.local/bin/imgcat https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat
chmod u+x $HOME/.local/bin/img{cat,ls}

### Set up vim
git clone --recursive https://github.com/rameshvs/dotvim $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc
touch $HOME/.vim/viminfo
ln -s $HOME/.vim/viminfo $HOME/.viminfo

### Set up neovim, but only if it's installed
if command -v nvim >/dev/null 2>&1; then
    mkdir -p $HOME/.config/nvim
    git clone https://github.com/rameshvs/dotnvim $HOME/.config/nvim
    nvim +PlugInstall +qa
fi

### set up other stuff
cp tmux.conf $HOME/.tmux.conf
