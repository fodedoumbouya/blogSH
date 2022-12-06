#!/bin/sh
projectName=$1

indexFile=$projectName/"index.html"
indexCss=$projectName/css/"style.css"
indexImage=$projectName/images/


#----------------------------------------
  htmlTemplate="`cat ./template/html.txt`"
  # cssTemplate="`cat ./template/style.txt`"

#-----------------------------------------
#Fill up of index file from the template
echo $htmlTemplate > $indexFile

# Copie des images dans le dossier du project
echo "`cp -r ./images/* "./$projectName/images/"`"


# echo $cssTemplate > $indexCss
#Message sucess
echo "Congratulations! Ton project est prete"