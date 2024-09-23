module "ec2" {
    source = "../terraform-aws-ec2"

    ami_id = var.ami_id
    instance_type = "t3.large"
    security_group_ids = ["sg-088988091b81eae5c"]  
}