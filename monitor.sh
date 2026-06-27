#!/bin/bash

echo "=============================================" > ~/admin.log
echo " SERVER MONITOR REPORT " >> ~/admin.log
echo " Generated: $(date) " >> ~/admin.log
echo "=============================================" >> ~/admin.log
echo "" >> ~/admin.log

echo "--Suspcious Requests--" >> ~/admin.log
grep -E "404|408|500|401" /var/log/apache2/access.log >> ~/admin.log
echo "" >> ~/admin.log

echo "---Repeated IPs___" >> ~/admin.log
awk '{print $1}' /var/log/apache2/access.log | sort | uniq -c | sort -rn | awk '$1 > 1' >> ~/admin.log
echo "" >> ~/admin.log

echo "=============================================" >> ~/admin.log
echo " END OF REPORT " >> ~/admin.log

