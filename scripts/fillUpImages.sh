#!/bin/bash

PATH_IMAGES=$1
projectName=$2

LISTE_IMAGES=($(ls $PATH_IMAGES))

# rm -f  ./template/fillUpImages.txt
touch ./template/fillUpImages.txt

for image in "${LISTE_IMAGES[@]}"
do
   echo "<img class='image' src='$PATH_IMAGES/$image' alt=''/>" >> ./template/fillUpImages.txt
   echo "<br>" >> ./template/fillUpImages.txt

done


exec sh ./scripts/generateFile.sh $projectName

