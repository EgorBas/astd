mysqldump -uroot -proot asuod > d:\Java\astd\dampDB\dump.sql
mysql -uroot -proot asuod < d:\Java\astd\dampDB\dump.sql
mysql -uegorbas -p123!@#qweQWE asuod < asuod/dumpDB/asuod_init_dump.sql


scp -i ~/.ssh/amazon_ec2_key.pem \
ec2-user@ec2-18-222-193-73.us-east-2.compute.amazonaws.com:/home/ec2-user/asuod/log.txt \
target/asuod-0.0.1-SNAPSHOT.jar