#!/bin/bash

numberArguments=$#
projectName=$1
targetDirectory=$2

createProject() {
  if [[ -d "${targetDirectory}/${projectName}" ]]
    then
      while true; do

      read -p "This directory $projectName is already exist in directory '$targetDirectory'. Are you sure that yo want to override this directory ? (yes/no)" yn

      case $yn in
        [Yy]* )
          cmd "`rm -rf ${targetDirectory}/${projectName}`"
          exec bash ./scripts/createDirectory.sh $projectName $targetDirectory
        break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
    else
      exec bash ./scripts/createDirectory.sh $projectName $targetDirectory
  fi
}

isTargetDestinationExist() {
  if [[ -d ${targetDirectory} ]]
    then
      return 0
  else
    echo "The target destination don't exist. Please check and try again"
    return 1
  fi
}

isWritePermission(){

  if [[ ! -w ${targetDirectory} ]]
  then
    echo "You can't create the project into this directory '$targetDirectory' because of write permissions. Please check and try again. "
    return 1
  else
    return 0
  fi
}


main() {

  if [ $numberArguments != 2 ];
    then
      echo "You should to have exactly two arguments. Run 'bash build.sh --help' for more information."
    else
      if isTargetDestinationExist;
        then

          if isWritePermission
            then
              createProject
          fi
      fi
  fi

}

function help(){
  cat ./README.md
}

function debug(){
    echo "debug";
}


if [ "$1" = "--help" ]; then
    help
elif [ "$1" = "--debug" ]; then
    debug
else
    main
fi