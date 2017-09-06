#!/bin/bash
# 2017-09-06, swemarx.

export PATH=/bin:/sbin:/usr/bin:/usr/sbin

if [ -d ~/.vim -o -f ~/.vimrc ]; then
	vimbackup="$HOME/vim-config-$(date '+%Y%m%d%H%M%S').tgz"
	echo "Backing up old config to $vimbackup"
	tar cvfz $vimbackup ~/.vimrc ~/.vim >/dev/null
fi

echo "Clearing out ~/.vim.."
[ -d ~/.vim ] && rm -rf ~/.vim

echo "Setting up directory structure.."
mkdir -p ~/.vim/{autoload,plugin}

echo "Installing new .vimrc.."
cp .vimrc ~/

echo "Installing VimPlug.."
curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null 2>&1

echo "Installing vim-sensible.."
curl -fLo ~/.vim/plugin/sensible.vim https://raw.githubusercontent.com/tpope/vim-sensible/master/plugin/sensible.vim >/dev/null 2>&1

echo "Installing vim-files.."
cp *.vim ~/.vim/plugin/

echo "Installing plugins.."
vim +PlugInstall +q +q

echo -e "Done!\n"

echo "You also need fzy and make sure it resides in your \$PATH"
echo "Check https://github.com/jhawthorn/fzy for details."
