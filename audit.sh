#!/bin/bash
echo " ====================================== " > ~/audit.log
echo " AUDIT REPORT " >> ~/audit.log
echo " Generated $(date) " >> ~/audit.log
echo " ====================================== " >> ~/audit.log
echo "" >> ~/audit.log

echo " Total Requests " >> ~/audit.log
wc -l /var/log/apache2/access.log >> ~/audit.log
echo "" >> ~/audit.log

echo " Successful Requests " >> ~/audit.log
grep -E "200" /var/log/apache2/access.log | wc -l >> ~/audit.log
echo "" >> ~/audit.log

echo " Most Active IP " >> ~/audit.log
awk '{print $1}' /var/log/apache2/access.log | sort | uniq -c | sort -rn | head -1 >> ~/audit.log
echo "" >> ~/audit.log

echo " ====================================== " >> ~/audit.log
echo " END OF REPORT " >> ~/audit.log
echo " ====================================== " >> ~/audit.log
