resource "aws_dynamodb_table" "book" {
  name           = "Book"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "ISBN"
  range_key      = "BookTitle"

  attribute {
    name = "ISBN"
    type = "S"
  }

  attribute {
    name = "BookTitle"
    type = "S"
  }

  global_secondary_index {
    name            = "BookTitleIndex"
    hash_key        = "BookTitle"
    range_key       = "ISBN"
    write_capacity  = 1
    read_capacity   = 1
    projection_type = "ALL"
  }

  point_in_time_recovery {
    enabled = false
  }

  server_side_encryption {
    enabled = true
  }

  tags = var.tags
}
