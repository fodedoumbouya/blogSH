#!/bin/bash

PATH_IMAGES=$1

LISTE_IMAGES=($(ls $PATH_IMAGES))

touch ./template/fillUpImages.txt

for image in "${LISTE_IMAGES[@]}"
do
   echo "<img  src='$PATH_IMAGES$image' alt=''/>" >> ./template/fillUpImages.txt
done