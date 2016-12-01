#Alpha-Centauri

<b>Requirements to Run the Test Automation</b>
<ol><li>Linux OS</li>
<li>Apache Maven</li>
<li>Eclipse IDE</li>
<li>This Repository (which containts the necessary OpenMRS source code files)</li></ol>

<b>How to Run the Test Automation</b><br>

Once you have the above requirements and have cloned the repository, simply open your terminal and change your current working directory (by using the "cd" command) to the TestAutomation directory.  From there you can run the following command:

./scripts/runAllTests.sh

This will start the script that goes through the test case files and creates the report.

<b>To run fault injections</b><br>
Our fault injections are located in two separate java files.  The direcory in which they are located is as follows:<br>
TestAutomation/project/src/api/src/main/java/org/openmrs<br>
The first java file that we injected a fault into the "Allergies.java" file.  Within that file we add code to break the public boolean add(Allergy allergy) method.  To inject the faults, uncomment the two lines below where it says to uncomment the following two lines to inject the faults. You will also need to comment out the return statement under where the code says to comment the following line to inject the faults.
