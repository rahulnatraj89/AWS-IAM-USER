variable "s3_bucket_name" {
  description = "name of the s3 bucket"
  type = string
  default = ""
  
}

variable "user_name" {
  description = "name of the iam user"
  type = string
  default = ""

}

variable "opensearch_name" {
  description = "name of domain"
  type = string
  default = ""
  
}

variable "bucket_name" {
  description = "name of the s3 bucket"
  type = string
  default = ""
}
variable "region" {
  description = "AWS region"
  type        = string
  default     = ""
}
