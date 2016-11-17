#!/bin/bash

echo "changing directory to testCases..."
cd testCases
echo "reading test cases..."

rm -r ../reports/*	#clear the reports directory
#sets up initial html Doc---------------------------------------------------
echo "<!DOCTYPE html>" >>../reports/htmlTemplate.html
echo  "<html>" >> ../reports/htmlTemplate.html
echo "<head>" >> ../reports/htmlTemplate.html
echo  "<title>Test Report</title>" >> ../reports/htmlTemplate.html
echo  "</head>" >> ../reports/htmlTemplate.html
echo  "<body>" >> ../reports/htmlTemplate.html
echo  "<table border=1 style=width:75%>" >> ../reports/htmlTemplate.html
echo  "<tr>" >> ../reports/htmlTemplate.html
echo  "<th> Test # </th>">> ../reports/htmlTemplate.html
echo  "<th> Requirement </th>" >> ../reports/htmlTemplate.html
echo  "<th> class name </th>">> ../reports/htmlTemplate.html
echo  "<th> method name </th>">> ../reports/htmlTemplate.html
echo  "<th> input </th>">> ../reports/htmlTemplate.html
echo  "<th> output </th>">> ../reports/htmlTemplate.html
echo  "<th> expected output </th>" >> ../reports/htmlTemplate.html
echo  "<th> pass/fail </th></tr>">> ../reports/htmlTemplate.html
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------



testCaseTracker=1  #tracks what test case is being worked on
lineStorage=( ) #array for storing lines from test case files
for filename in *    #goes through all the files in testCase dir
do
echo "<tr>" >> ../reports/htmlTemplate.html
   
   counter=0
	while IFS='' read -r line;do #reads lines from a test Case file
	   lineStorage[$counter]="$line" 
#0=TestCaseNumber, 1=Requirement, 2=ClassName, 3=MethodName, 4=input, 5=expectedOutput, 6=classpath, 7=DriverName
	  if [ "$counter" -eq 0 ] || [ "$counter" -eq 1 ] || [ "$counter" -eq 2 ] || [ "$counter" -eq 4 ] 
	   then
		echo "<td>" >> ../reports/htmlTemplate.html
		echo ${lineStorage[$counter]} >> ../reports/htmlTemplate.html
           elif [ "$counter" -eq 3 ];then
                echo "<td>" >> ../reports/htmlTemplate.html
                #all=${lineStorage[$counter]}
                #first=${all%% )}
                #${lineStorage[$counter]} | head -n1 | cut -d ")" -f1
               METHOD=${lineStorage[$counter]}
               MyMethod=${METHOD##* }
                echo $METHOD | sed 's/,.*//' >> ../reports/htmlTemplate.html
		
	  fi






	((counter++))
	        echo "</td>" >> ../reports/htmlTemplate.html
	done < "$filename"


cd .. #go back to TestAutomation directory

#pipes input into java driver classes and puts them in html table
output=$(echo ${lineStorage[4]} | java -classpath ${lineStorage[6]} ${lineStorage[7]} "${lineStorage[4]}")
echo "<td>" >> reports/htmlTemplate.html
echo $output >> reports/htmlTemplate.html
echo "</td>" >> reports/htmlTemplate.html

#prints out expected output from test case
echo "<td>" >> reports/htmlTemplate.html
echo ${lineStorage[5]}>> reports/htmlTemplate.html
echo "</td>" >> reports/htmlTemplate.html

#compares expected output to actual output and decides if test passed or failed
echo "<td" >> reports/htmlTemplate.html
if [ "$output" == "${lineStorage[5]}" ];then
   echo "style=\"color:#0D7010;\">Passed" >> reports/htmlTemplate.html
else
   echo "style=\"color:#FF0000;\">Failed" >> reports/htmlTemplate.html
fi
echo "</td>" >> reports/htmlTemplate.html




echo "</tr>" >> reports/htmlTemplate.html #ends a row in the table
echo "test case $testCaseTracker complete"
((testCaseTracker++))
cd testCases
done

cd ../reports #goes to report dir
xdg-open htmlTemplate.html #opens the html file
