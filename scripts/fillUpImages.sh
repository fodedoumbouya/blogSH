#!/bin/bash

PATH_IMAGES=$1
projectName=$2

LISTE_IMAGES=($(ls $PATH_IMAGES))

touch ./template/fillUpImages.txt

for image in "${!LISTE_IMAGES[@]}"
do
    if [ $image == 0 ]
    then
        echo "<img class='image' src='$PATH_IMAGES/${LISTE_IMAGES[$image]}' alt=''/>" > ./template/fillUpImages.txt
    else
        echo "<img class='image' src='$PATH_IMAGES/${LISTE_IMAGES[$image]}' alt=''/>" >> ./template/fillUpImages.txt
    fi
    
    echo "<br>" >> ./template/fillUpImages.txt
done

exec bash ./scripts/generateFile.sh $projectName