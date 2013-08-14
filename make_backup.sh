#!/bin/sh
#
# Require rsync

# ------------- system commands used by this script --------------------
RSYNC=/usr/bin/rsync;

# ------------- file locations -----------------------------------------
SOURCE=/THE/SOURCE/DIRECTORY
REMOTE_DESTINATION=/THE/REMOTE/DIRECTORY
EXCLUDE=./exclude.example

# ------------- distant machine information ----------------------------
REMOTE_USR=USERNAME
REMOTE_MACHINE=HOST.DOMAIN.LTD

# ------------- the script itself --------------------------------------
#DEST=backup_`date +%Y\%m\%d`
DEST=$REMOTE_DESTINATION
$RSYNC \
	-ave ssh --delete \
	--exclude-from=$EXCLUDE \
	$SOURCE $REMOTE_USR@$REMOTE_MACHINE:$DEST 

#cd ~$USER
#{
#	echo
#	date
#	dest=~/backup/`date +%A`
#	mkdir $dest.new
#	find . -xdev -type f \( -mtime 0 -or -mtime 1 \) -exec cp -aPv "{}"
#	$dest.new \;
#	cnt=`find $dest.new -type f | wc -l`
#	if [ $cnt -gt 0 ]; then
#	rm -rf $dest
#	mv $dest.new $dest
#	fi
#	rm -rf $dest.new
#	rsync -Cavze ssh . samba:backup
#} >> ~/backup/backup.log 2>&1
