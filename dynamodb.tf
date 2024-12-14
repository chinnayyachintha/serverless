# dynamodb table
resource "aws_dynamodb_table" "dynamodb" {
  name           = "${var.dynamodb_table}"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"
  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "${var.dynamodb_table}"
  }
  
}