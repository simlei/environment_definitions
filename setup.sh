#!/bin/bash

LOCALBASH_DIR = "$HOME/environment_definitions"
backupdir="$HOME/backup"



if [ ! -d "$LOCALBASH_DIR" ]; 
then 
  log_error "$LOCALBASH_DIR does not exists!"
  exit
fi

echo "This sets up your .bashrc, .bash_profile and .envrc. Overwritten files are backed up to ~/backup."
mkdir -p "$HOME/backup"

if [ ! -d "$backupdir" ]; 
then 
  log_error "$backupdir could not be created!"
  exit
fi

backupfiles=( ".bashrc" ".bash_profile" ".envrc" ".profile")

for i in "${backupfiles[@]}"
do
   : 
   file="$HOME/$i"
   if [ -f "$HOME/$i" ]
   then
     echo "backing up $file ..."
     mv $file "$backupdir/${i}_$(date +%F-%T)"
   fi
done

function copy_



ln -s "$LOCALBASH_DIR/configurations/direnv/direnvrc" "$HOME/.config/direnv/direnvrc"
