#!/bin/bash
echo " ===================================== " > ~/errorcount.log
echo " ERROR COUNT REPORT " >> ~/errorcount.log
echo " generated $(date) " >> ~/errorcount.log
echo " ===================================== " >> ~/errorcount.log
echo "" >> ~/errorcount.log

echo " ERROR COUNT: " >> ~/errorcount.log
grep -oE "404|408|500|401" /var/log/apache2/access.log | sort | uniq -c | sort -rn >> ~/errorcount.log
echo "" >> ~/errorcount.log

echo " ===================================== " >> ~/errorcount.log
echo " END OF REPORT " >> ~/errorcount.log
echo " ===================================== " >> ~/errorcount.log
