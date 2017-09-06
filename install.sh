#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

# Backup old config
if [ -d "~/.vim" -o -f "~/.vimrc" ]; then
	vimbackup="~/vim-config-$(date '+%Y%m%d%H%M%S').tgz"
	tar cvfz $vimbackup ~/.vimrc ~/.vim >/dev/null 2>&1
	echo "Backing up old config to $vimbackup"
fi

echo "Clearing out ~/.vim.."
[ -d ~/.vim ] && rm -rf ~/.vim

echo "Setting up directory structure.."
mkdir -p ~/.vim/{autoload,plugin}

echo "Installing new .vimrc.."
cp .vimrc ~/

echo "Installing VimPlug.."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null 2>&1

echo "Installing vim-files.."
cp *.vim ~/.vim/plugin/

echo "Installing plugins.."
vim +PlugInstall +q +q
