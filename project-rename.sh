#!/bin/sh

echo "===Xcode Project Renamer===\nWarning: From and Target Project Names cannot contain spaces and will lead to corrupt Xcode Projects!!"
echo "===========================\n"
read -p $'What is the current project name?\x0a[Skeleton] ' OLD_PROJECT_NAME
read -p $'\x0aWhat should this project be renamed to?\x0a' NEW_PROJECT_NAME

if [[ $OLD_PROJECT_NAME == "" ]]; then
   OLD_PROJECT_NAME=Skeleton
fi

if [[ $NEW_PROJECT_NAME == "" ]]; then
  echo "Error: New project name cannot be empty"
  exit 1
fi

echo "\nRenaming Xcode Project from: $OLD_PROJECT_NAME to: $NEW_PROJECT_NAME"
read -p $'Is this ok? y/N ' CONFIRM_RENAME

if [[ $CONFIRM_RENAME == "y" ]]; then
  curl https://raw.githubusercontent.com/appculture/xcode-project-renamer/master/Sources/main.swift -o rename.swift && chmod +x rename.swift
  ./rename.swift "$OLD_PROJECT_NAME" "$NEW_PROJECT_NAME"
  rm rename.swift
else
  echo "\nConfirmation not given. Aborting rename..."
  exit 0
fi
