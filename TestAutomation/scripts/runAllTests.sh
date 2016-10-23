
for SCRIPT in TestAutomation/scripts
do
   if [ -f $SCRIPT -a -x $SCRIPT ]
   then
        $SCRIPT
   fi
done
