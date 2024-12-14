# output of dynamodb table name
output "dynamodb_table_name" {
  value = aws_dynamodb_table.dynamodb.name
}

# output of lambda function name
output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
}

# output of lambda function arn
output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}

# output of api gateway name
output "api_gateway_name" {
  value = aws_api_gateway_rest_api.api_gateway.name
}