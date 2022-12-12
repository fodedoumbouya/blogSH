#!/bin/bash
projectName=$1

indexFile=$projectName/"index.html"
indexCss=$projectName/css/"style.css"
indexImage=$projectName/images/


  htmlTemplate1="`cat ./template/html1.txt`"
  htmlTemplatefillUpImages="`cat ./template/fillUpImages.txt`"
  htmlTemplate2="`cat ./template/html2.txt`"
  htmlTemplateNoImage="`cat ./template/noImage.txt`"


  cssTemplate="`cat ./template/style.txt`"

LISTE_IMAGES=($(ls images/))
if 
[  ${#LISTE_IMAGES[@]}  != 0  ]
then
      echo $htmlTemplate1 >>  $indexFile
      echo $htmlTemplatefillUpImages >>  $indexFile
      echo $htmlTemplate2 >>  $indexFile
      # Copie des images dans le dossier du project
      echo "`cp -r ./images/* "./$projectName/images/"`"
else
      echo $htmlTemplateNoImage >>  $indexFile
fi

echo $cssTemplate > $indexCss



echo "Congratulations! Ton project est prete"

echo `open  $projectName/index.html`