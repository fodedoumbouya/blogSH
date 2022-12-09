#!/bin/sh

projectName=$1

if [[ -d $projectName ]]
then

  while true; do

    read -p "This directory $projectName is exist already in your current directory. Do you want to override this directory ? (yes/no)" yn

    case $yn in
        [Yy]* )
          echo "`rm -rf $projectName`"
          exec  sh ./scripts/createDirectory.sh "$projectName"
          echo "This directory has been overwritten." ;
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done

else
  exec sh ./scripts/createDirectory.sh $projectName
fi