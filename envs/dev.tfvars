region          = "us-east-2"
cidr_block      = "10.0.0.0/16"
public_subnet1  = "10.0.1.0/24"
public_subnet2  = "10.0.2.0/24"
private_subnet1 = "10.0.101.0/24"
private_subnet2 = "10.0.102.0/24"
# name_prefix      = "foobar"
image_id         = "ami-0c55b159cbfafe1f0"
instance_type    = "t2.micro"
desired_capacity = 2
max_size         = 10
min_size         = 2
# subnets          = ["subnet-03e9cab473ca995a4"]
tags = {
  Name = "test"
}

