#!/bin/bash
cp .vimrc ~/.vimrc
cp -r ./vim/.vim ~/.vim
vim -c 'PlugInstall'
read -p "If you remove the installation package?[y/n]" input
case $input in
	[yY]*)
		cd ../
		sudo rm -r vim-config
		echo "Delete Successfully"
		;;
	[nN]*)
		exit
		;;
	*)
		echo "Just enter y or n,please."
		exit
		;;
esac		
