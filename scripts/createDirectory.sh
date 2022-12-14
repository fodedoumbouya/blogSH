#!/bin/bash
projectName=$1
targetDirectory=$2

  mkdir $targetDirectory/$projectName
  mkdir $targetDirectory/$projectName/css
  mkdir $targetDirectory/$projectName/images

  touch $targetDirectory/$projectName/"index.html"
  touch $targetDirectory/$projectName/css/"style.css"

  exec bash ./scripts/fillUpImages.sh ./images $targetDirectory/$projectName
