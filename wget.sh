#!/bin/sh

# ------------- system commands used by this script --------------------
WGET=/usr/bin/wget

# ------------- options ------------------------------------------------

URL=$1
USER=$2
PASSWORD=$3

# ------------- the script itself --------------------------------------
$WGET\
    --mirror --http-user=$USER --http-password=$PASSWORD $URL
    --no-check-certificate --no-parent --no-host-directories --execute
    robots=off --reject "index.html*
