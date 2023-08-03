#!/bin/bash

# Set the backup folder name
BACKUP_FOLDER=".backup"

# Rename old .backup file if it exists
if [ -d ~/${BACKUP_FOLDER} ]; then
  timestamp=$(date +%Y-%m-%d$Y)
  printf "Renaming  existing backup file to: ~/${BACKUP_FOLDER}-$timestamp\n";
  mv ~/${BACKUP_FOLDER} ~/${BACKUP_FOLDER}-$timestamp
else
  mkdir ~/${BACKUP_FOLDER}
fi

# Copy all hidden files to the backup folder
for file in ~/.*; do
  if [ "${file}" != "~/.${BACKUP_FOLDER}" ]; then
    printf "Copying file: $file\n"
    cp "$file" ~/${BACKUP_FOLDER}
  fi
done
