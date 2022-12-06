#!/bin/sh
projectName=$1
bootstrap=$2


indexFile=$projectName/"index.html"
indexCss=$projectName/css/"style.css"

#----------------------------------------
  htmlTemplate="`cat ./template/html.txt`"
  bootstrapHtmlTemplate="`cat ./template/bootstrapHtmlTemplate.txt`"
  cssTemplate="`cat ./template/style.txt`"

#-----------------------------------------
  if [[ $bootstrap == 'b' ]]
  then
    echo $bootstrapHtmlTemplate > $indexFile
  else
    echo $htmlTemplate > $indexFile
    echo $cssTemplate > $indexCss
  fi
  echo "Congratulations! Ton project est prete"