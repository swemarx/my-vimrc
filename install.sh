#!/bin/sh

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

# Backup old config
tar cvfz ~/vim-config-$(date '+%Y%m%d%H%M%S').tgz ~/.vimrc ~/.vim

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
