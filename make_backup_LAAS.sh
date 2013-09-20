#!/bin/sh

# ------------- system commands used by this script --------------------
RSYNC=/usr/bin/rsync;

# ------------- file locations -----------------------------------------

SOURCE=/home/crobin/LAAS
REMOTE_DESTINATION=/home/crobin/backup/
#EXCLUDE=/home/crobin/rsync/exclude
EXCLUDE=

# ------------- distant machine information ----------------------------
REMOTE_USR=crobin
REMOTE_MACHINE=lardenne.laas.fr
REMOTE_MACHINE=anna.laas.fr
#REMOTE_MACHINE=ragnarok.laas.fr


# ------------- the script itself --------------------------------------
#DEST=backup_`date +%Y\%m\%d`
DEST=$REMOTE_DESTINATION
$RSYNC \
	-ave ssh --delete \
	--exclude-from=$EXCLUDE \
	$SOURCE $REMOTE_USR@$REMOTE_MACHINE:$DEST 

#--link-dest=../${REMOTE_DESTINATION} ${SOURCE} ${REMOTE_DESTINATION}

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
