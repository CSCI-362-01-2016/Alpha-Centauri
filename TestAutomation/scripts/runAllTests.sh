
for SCRIPT in TestAutomation/scripts/*
do
   if [ -f $SCRIPT -a -x $SCRIPT ]
   then
        $SCRIPT
   fi
done


#!/bin/bash
clear
echo "---------Starting Script---------"
echo
echo "---------Generating Vars---------"
OUTPUT="OutputFile/"
FILE="examplePDF.pdf"
echo "---------Making Directories---------"
mkdir -p OutputFile/
echo "---------Converting---------"
java -Xmx512M&nbsp; -jar jpdf2html.jar $FILE $OUTPUT
echo "-----Starting PNGQuant Script-----"
find . -name '*.png' -exec pngquant --ext .png --force 256 {} \;
echo "-----Finished PNGQuant Script-----"
echo
echo "---------Finished Script---------"
