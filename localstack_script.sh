#!/bin/bash
# SCRIPT FOR GETTING MY AWS INFO

CTR="/opt/tmp"
TempPath="/opt/logs"

#The actual work
startDate="`date +%Y%m%d%H%M%S`";
echo "Task start at : $startDate";

pwd
df -h

cd /opt/

aws --no-verify-ssl s3api list-buckets

awslocal s3api create-bucket --bucket s3-bucket-03

aws --no-verify-ssl s3api list-buckets

awslocal s3api put-object --bucket s3-bucket-03 --key index.html --body index.html

awslocal sqs create-queue --queue-name sqs-01

#########

systemctl start docker

cd /opt/docker/localstack/

docker-compose up      #### Start with the yml file

localstack config validate  #### Alternately start by localstack start -d

localstack status services
	

cd /opt/

mkdir /opt/terraform_quickstart && cd /opt/terraform_quickstart

chmod -R 777 /opt/terraform_quickstart

cp /tmp/aws_sqs* /opt/terraform_quickstart/

terraform init

terraform apply

wait 320

endDate="`date +%Y%m%d%H%M%S`";
echo "task end at : $endDate";

end
