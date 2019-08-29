#/bin/bash

cd /app/${GIT_REPO}
git pull origin master >> /var/log/cron.log 2>&1