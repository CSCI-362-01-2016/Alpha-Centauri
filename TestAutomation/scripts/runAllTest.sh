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
echo  "<th> expected output </th>" >> ../reports/htmlTemplate.html
echo  "<th> pass/fail </th></tr>">> ../reports/htmlTemplate.html

lineStorage=( ) #array for storing lines from test case files
for filename in *    #goes through all the files in testCase dir
do
echo "<tr>" >> ../reports/htmlTemplate.html
   counter=0
	while IFS='' read -r line;do #reads lines from a test Case file
	   lineStorage[$counter]="$line"
	  if [ "$counter" -eq 0 ] || [ "$counter" -eq 2 ] || [ "$counter" -eq 3 ] || [ "$counter" -eq 4 ] 
	   then
		echo "<td>" >> ../reports/htmlTemplate.html
		echo ${lineStorage[$counter]} >> ../reports/htmlTemplate.html
	  fi
	((counter++))
	        echo "</td>" >> ../reports/htmlTemplate.html
	done < "$filename"

#this is where i think to do driver call
#cd ../project/src/api/target/classes
cd ..

output=$(echo ${lingStorage[$counter]} | java -classpath ${lineStorage[6]} org.openmrs.PersonNameDriverTest Nick)
pwd
echo "<td>" >> reports/htmlTemplate.html
echo $output >> reports/htmlTemplate.html
echo "</td>" >> reports/htmlTemplate.html


echo "</tr>" >> reports/htmlTemplate.html #ends a row in the table
cd testCases
done

cd ../reports #goes to report dir
xdg-open htmlTemplate.html #opens the html file
