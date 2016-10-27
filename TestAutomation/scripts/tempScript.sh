#!/bin/bash

echo "changing directory to testCases..."
cd testCases
echo "reading test cases..."

rm -r ../reports/*	
echo "<!DOCTYPE html>" >>../reports/htmlTemplate.html
echo  "<html>" >> ../reports/htmlTemplate.html
echo "<head>" >> ../reports/htmlTemplate.html
echo  "<title>Test Report</title>" >> ../reports/htmlTemplate.html
echo  "<head>" >> ../reports/htmlTemplate.html
echo  "<body>" >> ../reports/htmlTemplate.html
lineStorage=( )
for filename in *
do
   counter=0
	while IFS='' read -r line;do
	   lineStorage[$counter]="$line"
	   if [ "$counter" -eq 0 ] || [ "$counter" -eq 3 ] || [ "$counter" -eq 5 ]
	   then
		echo ${lineStorage[$counter]} >> ../reports/htmlTemplate.html
	   fi
	((counter++))
	   
	done < "$filename"

echo "<br>" >> ../reports/htmlTemplate.html
echo ""
done

cd ../reports
xdg-open htmlTemplate.html
