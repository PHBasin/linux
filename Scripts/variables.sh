#!/bin/bash

CODE="IMG_20201210_12345.jpg"
EXT=.jpg

echo "CODE: ${CODE}"
echo "CODE #: ${#CODE}"
echo "CODE pos4 et +: ${CODE:4}"
echo "CODE pos4 pour 6char: ${CODE:4:6}"
echo "CODE sans extension fixée: ${CODE%.jpg}"
echo "CODE sans extension $EXT: ${CODE%$EXT}"
echo "CODE sans prefix: ${CODE#IMG_}"
