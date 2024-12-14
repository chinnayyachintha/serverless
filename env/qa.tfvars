# aws_region
aws_region = "ap-southeast-2"

# VPC variables
vpc_name    = "PaymentGateway"
cidr        = "12.0.0.0/16"
azs         = ["ap-southeast-2a"]
pvt_subnets = ["12.0.1.0/24"]
pub_subnets = ["12.0.101.0/24"]

# dynamodb_table
dynamodb_table = "lambda-apigateway"

# lambda_function_name
lambda_function_name = "LambdaFunctionOverHttps"
