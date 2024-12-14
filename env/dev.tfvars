# aws_region
aws_region = "ca-central-1"

# VPC variables
vpc_name    = "PaymentGateway"
cidr        = "10.0.0.0/16"
azs         = ["ca-central-1a"]
pvt_subnets = ["10.0.1.0/24"]
pub_subnets = ["10.0.101.0/24"]

# dynamodb_table
dynamodb_table = "lambda-apigateway"

# lambda_function_name
lambda_function_name = "LambdaFunctionOverHttps"
