#!/bin/sh

projectName=$1
targetDirectory=$2

function createProject() {
  cd $targetDirectory

  if [[ -d ${projectName} ]]
    then
      while true; do

      read -p "This directory $projectName is exist already in directory '$targetDirectory'. Are you sure that yo want to override this directory ? (yes/no)" yn

      case $yn in
        [Yy]* )
          echo "`rm -rf $projectName`"
          exec sh ./scripts/createDirectory.sh $projectName $targetDirectory
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
    else
      echo "The project don't exist"
      exec sh ./scripts/createDirectory.sh $projectName $targetDirectory
  fi
}

function isWritePermission(){
  echo "$targetDirectory"
  if [[ ! -w ${targetDirectory} ]]
  then
    return 1
  else
    return 0
  fi
}


function main() {
  if isWritePermission;
    then
      isProjectExist
  else
     echo "You can't create the project into this directory '$targetDirectory' because of write permissions. Please check and try again. "
  fi
}

main