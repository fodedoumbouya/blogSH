#!/bin/sh
projectName=$1

indexFile=$projectName/"index.html"
indexCss=$projectName/css/"style.css"
indexImage=$projectName/images/


#----------------------------------------
  htmlTemplate1="`cat ./template/html1.txt`"
  htmlTemplatefillUpImages="`cat ./template/fillUpImages.txt`"
  htmlTemplate2="`cat ./template/html2.txt`"

  cssTemplate="`cat ./template/style.txt`"

#-----------------------------------------
#Fill up of index file from the template

echo $htmlTemplate1 >>  $indexFile
echo $htmlTemplatefillUpImages >>  $indexFile
echo $htmlTemplate2 >>  $indexFile

echo $cssTemplate > $indexCss


# Copie des images dans le dossier du project
echo "`cp -r ./images/* "./$projectName/images/"`"


#Message sucess
echo "Congratulations! Ton project est prete"

echo `open -a "Google Chrome" $projectName/index.html`