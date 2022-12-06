#!/bin/sh
projectName=$1

  mkdir $projectName
  mkdir $projectName/css
  mkdir $projectName/images

  touch $projectName/"index.html"
  touch $projectName/css/"style.css"

  exec sh ./scripts/generateFile.sh $projectName