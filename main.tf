provider "aws" {
  region = var.region
}

locals {
   s3_bucket_name         =    var.s3_bucket_name
   opensearch_domain_name =     var.opensearch_name
}

resource "aws_iam_user" "aws_iam_user_own" {
  name = var.user_name
  
}

resource "aws_iam_access_key" "aws_iam_user_own_access_key" {
  user = aws_iam_user.aws_iam_user_own.name
  
}


resource "aws_iam_policy" "aws_iam_user_own_policy" {
  name = var.user_name
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [   
                 "s3:ListBucket",
                 "s3:GetObject",
                 "s3:PutObject",
                 "s3:DeleteObject"
              


          ],
        
          "Resource":  [
                 "arn:aws:s3:::${var.s3_bucket_name}",
                 "arn:aws:s3:::${var.s3_bucket_name}/*"
            

          ]
        },
        {                          
            "Effect": "Allow",
            "Action": [

                 "es:ESHttpGet",
                 "es:ESHttpPost",
                 "es:ESHttpPut"


            ],
          "Resource": "arn:aws:es:${var.region}:${var.id}:domain/${var.opensearch_name}/*"
        }
    ]
})
}

resource "aws_iam_user_policy_attachment" "aws_iam_user_own_user_policy_attachment" {
  user = aws_iam_user.aws_iam_user_own.name
  policy_arn = aws_iam_policy.aws_iam_user_own_policy.arn
  
}

data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
