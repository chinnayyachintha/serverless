# aws_region
aws_region = "ap-south-2"

# VPC variables
vpc_name    = "PaymentGateway"
cidr        = "11.0.0.0/16"
azs         = ["ap-south-2a"]
pvt_subnets = ["11.0.1.0/24"]
pub_subnets = ["11.0.101.0/24"]

# dynamodb_table
dynamodb_table = "lambda-apigateway"

# lambda_function_name
lambda_function_name = "LambdaFunctionOverHttps"
