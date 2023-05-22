#!/usr/bin/env bash


# Creat a Symbolic Link under each configuration file
# to management configuration.
# eg: ln -s ./config/foot/foot.ini ~/.config/foot/

HOME_DIR=$( getent passwd "$USER" | cut -d: -f6 )
SYS_CONFIG_DIR="${HOME_DIR}/.config"
PER_CONFIG=($PWD/config/*/)
PER_CONFIG_DIR=("${PER_CONFIG[@]%/}")

for dir in "${PER_CONFIG_DIR[@]##*/}"
do
    if [ ! -d "$SYS_CONFIG_DIR/$dir" ]; then
	mkdir -p "$SYS_CONFIG_DIR/$dir"
	echo $dir
    fi
    ln -nfs $PWD/config/$dir/* $SYS_CONFIG_DIR/$dir
done

## zsh configuration
ln -nfs $PWD/zsh/zshrc $HOME_DIR/.zshrc
