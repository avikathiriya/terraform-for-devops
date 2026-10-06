resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.environment}-${var.s3_bucket_name}"
  

  tags = {
    Name        = "${var.environment}-${var.s3_bucket_name}"
    Environment = "${var.environment}"
  }
  
}