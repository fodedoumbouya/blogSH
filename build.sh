#!/bin/sh

projectName=$1
bootstrap=$2

if [[ -d $projectName ]]
then
  echo "This directory is exist already in your current directory."
else

  # creation des Dossiers et les Fichiers
  exec sh ./scripts/createDirectory.sh $projectName $bootstrap
fi