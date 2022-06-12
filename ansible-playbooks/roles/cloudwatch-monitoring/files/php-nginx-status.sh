#!/bin/bash
export PATH=$PATH:/usr/local/bin/:/usr/bin
INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
#Nginx Active connection monitoring
ActiveConnections=`curl -s http://localhost/nginx_status |grep -i "active connections" | awk '{print $3}'`

ASG=`aws ec2 describe-tags --filters "Name=resource-id,Values=${INSTANCE_ID}" | jq '.Tags[] | select(.Key=="aws:autoscaling:groupName") | .Value'`
if [ ! -z "$ASG" ]
then
    aws cloudwatch put-metric-data --metric-name PhpFpmThreads --namespace EC2 --value `ps aux | grep "php-fpm: pool magento" | wc -l` --timestamp `date -u +"%Y-%m-%dT%H:%M:%SZ"` --dimensions="AutoScalingGroupName=${ASG}"
    aws cloudwatch put-metric-data --metric-name NginxThreads --namespace EC2 --value $ActiveConnections  --timestamp `date -u +"%Y-%m-%dT%H:%M:%SZ"` --dimensions="AutoScalingGroupName=${ASG}"
fi
