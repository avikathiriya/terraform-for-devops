resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name           = "${var.environment}-infra-app-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name  = "${var.environment}-infra-app-table"
    Environment = var.environment
  }
  
}