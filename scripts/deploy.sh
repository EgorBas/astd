#!/usr/bin/env bash

echo 'Maven clean and package...'

mvn clean package

echo 'Copy Application file...'

scp -i ~/.ssh/amazon_ec2_key.pem \
target/asuod-0.0.1-SNAPSHOT.jar \
ec2-user@ec2-18-217-69-92.us-east-2.compute.amazonaws.com:/home/ec2-user/asuod/

#echo 'Copy DumpDB file...'
#scp -i ~/.ssh/amazon_ec2_key.pem \
#dumpDB/asuod_init_dump.sql \
#ec2-user@ec2-18-217-69-92.us-east-2.compute.amazonaws.com:/home/ec2-user/asuod/dumpDB/

echo 'Restart server...'

ssh -i ~/.ssh/amazon_ec2_key.pem ec2-user@ec2-18-217-69-92.us-east-2.compute.amazonaws.com <<EOF
pgrep java | xargs kill -9
nohup java -jar asuod/asuod-0.0.1-SNAPSHOT.jar > log.txt 2>&1 &
EOF

echo 'Bye'
 #chmod +x scripts/deploy.sh
 #./scripts/deploy.sh
