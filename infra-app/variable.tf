variable "ec2_instance_type" {
  description = "The type of EC2 instance to use"
  type        = string
}

variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string
}
variable "environment" {
  description = "The environment for the resources"
  type        = string
}

variable "ec2_ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
}
