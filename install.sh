#! /bin/bash

echo "Installing Vundle"
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


echo "Installing vim modules"
cp ./.vim_modules ~/.vimrc
vim -E -c BundleInstall -c q
mv ~/.vimrc ~/.vim_modules

echo "Moving .vimrc file"
cp ./.vimrc ~/.vimrc
