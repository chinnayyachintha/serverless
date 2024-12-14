# lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.lambda_function_name}"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"
  filename = "lambda/dynamodb_manager.zip"
  source_code_hash = filebase64sha256("lambda/dynamodb_manager.zip")
  timeout = 60
  memory_size = 128

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.dynamodb_table.name
    }
  }

  # vpc
  vpc_config {
    subnet_ids = [aws_subnet.lambda_subnet.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  tags = {
    Name = "${var.lambda_name}"
  }

}