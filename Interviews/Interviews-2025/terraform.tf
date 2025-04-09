module "vpc" {
  source = "value"
}

resource "aws_instance" "name" {
  depends_on = [  ]

  lifecycle {
    create_before_destroy = 
    ignore_changes = [  ]
    prevent_destroy = false
    replace_triggered_by = [  ]
    
  }
}

data "aws_acm_certificate" "name" {
  
}

variable "aws_instance" {
  
}

locals {
  
}

