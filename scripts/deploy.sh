#!/usr/bin/env bash

#mvn clean package

echo 'Copy files...'

scp -i ~/.ssh/amazon_ec2_key.pem \
target/asuod-0.0.1-SNAPSHOT.jar \
ec2-user@ec2-18-222-193-73.us-east-2.compute.amazonaws.com:/home/ec2-user/

echo 'Restart server...'

ssh -i ~/.ssh/amazon_ec2_key.pem ec2-user@ec2-18-222-193-73.us-east-2.compute.amazonaws.com <<EOF
pgrep java | xargs kill -9
nohup java -jar asuod-0.0.1-SNAPSHOT.jar > log.txt &
EOF

echo 'Bye'
