resource "aws_iam_role" "lambda_role" {
    name = "${var.lambda_function_name}-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "lambda.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_policy" "lambda_policy" {
    name        = "${var.lambda_function_name}_policy"

    description = "Custom policy with permission to DynamoDB and CloudWatch Logs. 
                    This custom policy has the permissions that the function needs 
                    to write data to DynamoDB and upload logs"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid = "Stmt1428341300017"
                Action = [
                    "dynamodb:DeleteItem",
                    "dynamodb:GetItem",
                    "dynamodb:PutItem",
                    "dynamodb:Query",
                    "dynamodb:Scan",
                    "dynamodb:UpdateItem"
                ]
                Effect   = "Allow"
                Resource = "*"
            },
            {
                Sid      = ""
                Resource = "*"
                Action   = [
                    "logs:CreateLogGroup",
                    "logs:CreateLogStream",
                    "logs:PutLogEvents"
                ]
                Effect = "Allow"
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "policy_attachment" {
    role       = aws_iam_role.lambda_role.name
    policy_arn = aws_iam_policy.lambda_policy.arn
}