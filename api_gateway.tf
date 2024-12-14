# aws_apigatewayv2_api
resource "aws_apigatewayv2_api" "http_api" {
  name          = "${var.lambda_function_name}-api"
  protocol_type = "HTTP"
}

# aws_apigatewayv2_api_mapping
resource "aws_apigatewayv2_api_mapping" "http_api_mapping" {
  api_id      = aws_apigatewayv2_api.http_api.id
  domain_name = aws_apigatewayv2_domain_name.http_domain_name.id
  stage       = aws_apigatewayv2_stage.http_stage.name
}

# aws_apigatewayv2_authorizer
resource "aws_apigatewayv2_authorizer" "http_authorizer" {
  api_id          = aws_apigatewayv2_api.http_api.id
  authorizer_type = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name            = "jwt-authorizer"
  jwt_configuration {
    audience = ["https://example.com"]
    issuer   = "https://example.com"
  }
}

# aws_apigatewayv2_deployment
resource "aws_apigatewayv2_deployment" "http_deployment" {
  api_id = aws_apigatewayv2_api.http_api.id
  description = "Deployment for stage ${aws_apigatewayv2_stage.http_stage.name}"
  stage_name = aws_apigatewayv2_stage.http_stage.name
}

# aws_apigatewayv2_domain_name
resource "aws_apigatewayv2_domain_name" "http_domain_name" {
  domain_name = "dynamodboperations.com"
  domain_name_configuration {
    certificate_arn = aws_acm_certificate.dynamodboperations.certificate_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}


# aws_apigatewayv2_integration
resource "aws_apigatewayv2_integration" "http_integration" {
  api_id              = aws_apigatewayv2_api.http_api.id
  integration_type    = "HTTP_PROXY"
  integration_method  = "POST"
  integration_uri     = "http://localhost:3000"
  payload_format_version = "2.0"
}

# aws_apigatewayv2_integration_response
resource "aws_apigatewayv2_integration_response" "http_integration_response" {
  api_id = aws_apigatewayv2_api.http_api.id
  integration_id = aws_apigatewayv2_integration.http_integration.id
  integration_response_key = "200"
  response_templates = {
    "application/json" = ""
  }
  content_handling_strategy = "CONVERT_TO_TEXT"
}

# aws_apigatewayv2_model
resource "aws_apigatewayv2_model" "http_model" {
  api_id = aws_apigatewayv2_api.http_api.id
  content_type = "application/json"
  description = "A JSON schema"
  name = "json-schema"
  schema = <<EOF
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "Example Schema",
  "type": "object",
  "properties": {
    "message": {
      "type": "string"
    }
  },
  "required": ["message"]
} 
EOF
}

# aws_apigatewayv2_route
resource "aws_apigatewayv2_route" "http_route" {
  api_id = aws_apigatewayv2_api.http_api.id
  route_key = "POST /"
  target = "integrations/${aws_apigatewayv2_integration.http_integration.id}"
}

# aws_apigatewayv2_route_response
resource "aws_apigatewayv2_route_response" "http_route_response" {
  api_id = aws_apigatewayv2_api.http_api.id
  route_id = aws_apigatewayv2_route.http_route.id
  route_response_key = "200"    
}

# aws_apigatewayv2_stage
resource "aws_apigatewayv2_stage" "http_stage" {
  api_id = aws_apigatewayv2_api.http_api.id
  name = "prod"
  stage_variables = {
    "var1" = "value1"
  }
}

# aws_apigatewayv2_vpc_link
resource "aws_apigatewayv2_vpc_link" "http_vpc_link" {
  name = "example"
  security_group_ids = [aws_security_group.http_sg.id]
  subnet_ids = [aws_subnet.http_subnet.id]
  tags = {
    Name = "example"
  }
}