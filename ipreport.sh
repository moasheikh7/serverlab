#!/bin/bash
echo " ===================================== " > ~/ipreport.log
echo " IP REPORT " >> ~/ipreport.log
echo " generated $(date) " >> ~/ipreport.log
echo " ===================================== " >> ~/ipreport.log
echo "" >> ~/ipreport.log

echo " Unique IP Address " >> ~/ipreport.log
awk '{print $1}' /var/log/apache2/access.log | sort | uniq -c | sort -rn >> ~/ipreport.log

echo "" >> ~/ipreport.log

echo " ===================================== " >> ~/ipreport.log
echo " END OF REPORT " >> ~/ipreport.log
echo " ===================================== " >> ~/ipreport.log
