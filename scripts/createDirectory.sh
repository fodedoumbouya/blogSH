#!/bin/sh
projectName=$1

  mkdir $projectName
  mkdir $projectName/css
  mkdir $projectName/scripts
  mkdir $projectName/images

  touch $projectName/"index.html"
  touch $projectName/css/"style.css"
  touch $projectName/scripts/"script.js"

  exec sh ./scripts/createProject.sh $projectName