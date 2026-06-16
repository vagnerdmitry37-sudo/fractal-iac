resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = var.billing_mode
  region       = var.region 

  hash_key = var.partition_key_name

  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null

  attribute {
    name = var.partition_key_name
    type = var.partition_key_type
  }

  lifecycle {
    precondition {
      condition = (
        var.billing_mode == "PAY_PER_REQUEST"
        || (
          var.billing_mode == "PROVISIONED"
          && var.read_capacity != null
          && var.write_capacity != null
        )
      )
      error_message = "read_capacity and write_capacity must be set when billing_mode is PROVISIONED."
    }
  }
}