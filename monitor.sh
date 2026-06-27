#!/bin/bash
# Filter suspicious HTTP error codes
grep -E "404|408|500|401" /var/log/apache2/access.log > ~/admin.log

# Show IPs appearing more than once in the access log
echo "---Repeated IPs___" >> ~/admin.log
awk '{print $1}' /var/log/apache2/access.log | sort | uniq -c | sort -rn | awk '$1 > 1' >> ~/admin.log

# Timestamp when this script last ran
echo "Log checked on: $(date)" >> ~/admin.log

