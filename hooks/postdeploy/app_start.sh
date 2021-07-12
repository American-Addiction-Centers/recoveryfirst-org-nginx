#!/bin/bash
echo "CLEAR THAT CACHES $WORDPRESS_URL"
echo "${WORDPRESS_URL/admin/}cache/fullpage/"
curl --connect-timeout 5 --max-time 10 --retry 5 --retry-delay 0 --retry-max-time 40 -X DELETE "https://staging.recoveryfirst.org/cache/fullpage/"
sleep 2
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/platforms-linux-extend.html
# $WORDPRESS_URL https://admin.adcare.com/
# the extra flags on the curl requests are so the command waits for a response
# https://stackoverflow.com/questions/42873285/curl-retry-mechanism
# --max-time 10     (how long each retry will wait)
# --retry 5         (it will retry 5 times)
# --retry-delay 0   (an exponential backoff algorithm)
# --retry-max-time  (total time before it's considered failed)