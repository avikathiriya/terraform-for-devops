module "dev-infra-app" {
  source = "./infra-app"
  environment = "dev"
  s3_bucket_name = "infra-app-bucket-10"
  ec2_instance_type = "t3.micro"
  ec2_ami_id = "ami-0b6d9d3d33ba97d99" # Example AMI ID
  instance_count = 1
  hash_key = "student_id"
}

module "prod-infra-app" {
  source = "./infra-app"
  environment = "prod"
  s3_bucket_name = "infra-app-bucket-prod-20"
  ec2_instance_type = "t3.micro"
  ec2_ami_id = "ami-0b6d9d3d33ba97d99" # Example AMI ID
  instance_count = 2
  hash_key = "student_id"
}
module "staging-infra-app" {
  source = "./infra-app"
  environment = "staging"
  s3_bucket_name = "infra-app-bucket-staging-30"
  ec2_instance_type = "t3.micro"
  ec2_ami_id = "ami-0b6d9d3d33ba97d99" # Example AMI ID
  instance_count = 1
  hash_key = "student_id"
}