# AWS Region where resources will be deployed
variable "aws_region" {
  type        = string
  description = "AWS Region to deploy resources"
}

# VPC variables
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "pvt_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "pub_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

# Name of the DynamoDB table
variable "dynamodb_table" {
  type        = string
  description = "Name of the DynamoDB table"
}

# Name of the Lambda function
variable "lambda_function_name" {
  type        = string
  description = "Name of the Lambda function"
}

