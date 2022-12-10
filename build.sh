#!/bin/sh

projectName=$1
targetDirectory=$2

function createProject() {
  echo "${targetDirectory}/${projectName}"
  if [[ -d "${targetDirectory}/${projectName}" ]]
    then
      while true; do

      read -p "This directory $projectName is exist already in directory '$targetDirectory'. Are you sure that yo want to override this directory ? (yes/no)" yn

      case $yn in
        [Yy]* )
          echo "`rm -rf ${targetDirectory}/${projectName}`"
          exec sh ./scripts/createDirectory.sh $projectName $targetDirectory
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
    else
      exec sh ./scripts/createDirectory.sh $projectName $targetDirectory
  fi
}

function isTargetDestinationExist() {
  if [[ -d ${targetDirectory} ]]
    then
      return 0
  else
    echo "The target destination don't exist. Please check and try again"
    return 1
  fi
}

function isWritePermission(){

  if [[ ! -w ${targetDirectory} ]]
  then
    echo "You can't create the project into this directory '$targetDirectory' because of write permissions. Please check and try again. "
    return 1
  else
    return 0
  fi
}


function main() {
  if isTargetDestinationExist;
    then

      if isWritePermission
        then
          createProject
      fi
  fi
}

main