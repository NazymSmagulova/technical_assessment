variable "region" {
  description = "Please provide a region name"
  type        = string
  default     = ""
}

variable "cidr_block" {
  description = "PLease Provide CIDR block for VPC"
  type        = string
  default     = ""
}

variable "image_id" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Provide a value"
  type        = string
  default     = ""
}

# variable "server_port" {
#   description = "The port the server will use for HTTP requests"
#   type        = number
#   default     = 8080
# }

# variable "elb_port" {
#   description = "The port the ELB will use for HTTP requests"
#   type        = number
#   default     = 80
# }


variable "tags" {
  description = "PLease Provide tags for resources"
  type        = map(any)
  default     = {}
}

variable "public_subnet1" {
  description = "PLease Provide subnet CIDR block"
  type        = string
  default     = ""
}

variable "public_subnet2" {
  description = "PLease Provide subnet CIDR block"
  type        = string
  default     = ""
}


variable "private_subnet1" {
  description = "PLease Provide subnet CIDR block"
  type        = string
  default     = ""
}

variable "private_subnet2" {
  description = "PLease Provide subnet CIDR block"
  type        = string
  default     = ""
}

variable "max_size" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "min_size" {
  description = "Provide a value"
  type        = string
  default     = ""
}

variable "desired_capacity" {
  description = "Provide a value"
  type        = string
  default     = ""
}
