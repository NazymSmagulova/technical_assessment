data "aws_availability_zones" "all" {}

# ---------------------------------------------------------------------------------------------------------------------
# AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.id
  availability_zones   = data.aws_availability_zones.all.names

  min_size          = var.min_size
  max_size          = var.max_size
  desired_capacity  = var.desired_capacity
  load_balancers    = [aws_elb.example.name]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# LAUNCH CONFIGURATION IN THE ASG
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_launch_configuration" "example" {
  # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type in us-east-2
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" from $(hostname -f)”  > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# SECURITY GROUP THAT'S APPLIED TO EACH EC2 INSTANCE IN THE ASG
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  # Inbound HTTP from anywhere
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.101.0/24", "10.0.102.0/24"]
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# ELB TO ROUTE TRAFFIC ACROSS THE AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_elb" "example" {
  name               = "terraform-asg-example"
  security_groups    = [aws_security_group.elb.id]
  availability_zones = data.aws_availability_zones.all.names

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# SECURITY GROUP THAT CONTROLS WHAT TRAFFIC AN GO IN AND OUT OF THE ELB
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "elb" {
  name = "terraform-example-elb"

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound HTTP from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
