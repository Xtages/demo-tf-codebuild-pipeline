# Create S3 bucket to store plan and plan outputs
BUCKET_NAME=bucket-name-here
aws s3api create-bucket --acl private --bucket $BUCKET_NAME

# login to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS \
--password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com

# build docker image in docker directory
docker build --tag ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/terraform-basic-pipeline:0.1.0 .
aws ecr create-repository --repository-name terraform-basic-pipeline --region us-east-1

# push image to ECR
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/terraform-basic-pipeline:0.1.0


