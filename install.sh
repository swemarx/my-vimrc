#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

# Backup old config
if [ -d "~/.vim" -o -f "~/.vimrc" ]; then
	vimbackup="~/vim-config-$(date '+%Y%m%d%H%M%S').tgz"
	tar cvfz $vimbackup ~/.vimrc ~/.vim >/dev/null 2>&1
	echo "Old config backed-up as $vimbackup"
fi

# Copy .vimrc in-place
cp .vimrc ~/

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
