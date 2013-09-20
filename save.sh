#!/bin/bash

SAVED_DIR=~/LAAS
SAFE_DIR=~/Dropbox/LAAS

echo -e "\n *** Répertoire à sauvegarder : \t $SAVED_DIR"
echo -e " *** Lieu de sauvegarde :       \t $SAFE_DIR\n"

du -sh --time ~/Dropbox 
du -sh --time $SAFE_DIR
du -sh --time $SAVED_DIR

echo -e "\nConfirmer la sauvegarde [Y/N] ? (l'ancienne sauvegarde sera écrasée)"
read answer

case "$answer" in

    	oui | o | O | Oui | OUI | y | Y | yes | Yes | YES ) 

		echo "Sauvegarde en cours..."
		cp -a $SAVED_DIR/* $SAFE_DIR  		#Mode 'Résumé'
		#cp -au $SAVED_DIR $SAFE_DIR 		#Mode Verbose

		echo -e "Sauvegarde de $SAVED_DIR effectué dans le répertoire $SAFE_DIR"
		echo -e "\n\t\t /!\ Penser à synchroniser Dropbox /!\\";;

    	#non | n | N | Non | NON | no | No | NO ) 
    		#echo " Procédure de sauvegarde annulée...";;

    	* ) 
    		echo -e "\nProcédure de sauvegarde annulée...";;
esac

echo -e "\n"
du -sh --time ~/Dropbox 
du -sh --time $SAFE_DIR
du -sh --time $SAVED_DIR

echo -e "\nDone.\n"
exit 0
