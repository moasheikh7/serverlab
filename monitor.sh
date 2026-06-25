#!/bin/bash
grep -E "404|408|500" /var/log/apache2/access.log > ~/admin.log
echo "log checked on: $(date)" >> ~/admin.log

