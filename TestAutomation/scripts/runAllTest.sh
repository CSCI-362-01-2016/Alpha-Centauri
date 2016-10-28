#!/bin/bash

echo "changing directory to testCases..."
cd testCases
echo "reading test cases..."

rm -r ../reports/*	#clear the reports directory
echo "<!DOCTYPE html>" >>../reports/htmlTemplate.html
echo  "<html>" >> ../reports/htmlTemplate.html
echo "<head>" >> ../reports/htmlTemplate.html
echo  "<title>Test Report</title>" >> ../reports/htmlTemplate.html
echo  "</head>" >> ../reports/htmlTemplate.html
echo  "<body>" >> ../reports/htmlTemplate.html
echo  "<table border=1 style=width:75%>" >> ../reports/htmlTemplate.html
echo  "<tr>" >> ../reports/htmlTemplate.html
echo  "<th> Test # </th>">> ../reports/htmlTemplate.html
echo  "<th> class name </th>">> ../reports/htmlTemplate.html
echo  "<th> method name </th>">> ../reports/htmlTemplate.html
echo  "<th> input </th>">> ../reports/htmlTemplate.html
echo  "<th> output </th>">> ../reports/htmlTemplate.html
echo  "<th> expected output </th></tr>">> ../reports/htmlTemplate.html

lineStorage=( )
for filename in *
do
echo "<tr>" >> ../reports/htmlTemplate.html
   counter=0
	while IFS='' read -r line;do
	   lineStorage[$counter]="$line"
	  if [ "$counter" -eq 0 ] || [ "$counter" -eq 3 ] || [ "$counter" -eq 5 ]
	   then
		echo "<td>" >> ../reports/htmlTemplate.html
		echo ${lineStorage[$counter]} >> ../reports/htmlTemplate.html
	  fi
	((counter++))
	        echo "</td>" >> ../reports/htmlTemplate.html
	done < "$filename"

echo "</tr>" >> ../reports/htmlTemplate.html

done

cd ../reports
xdg-open htmlTemplate.html
