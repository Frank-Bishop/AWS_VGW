# Main VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Env  = "AWS_native"
    Name = "main"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.priv1_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1a"

  tags = {
    Env  = "AWS_native"
    Name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.priv2_cidr
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1b"

  tags = {
    Env  = "AWS_native"
    Name = "main-private-2"
  }
}

# Internet GW
#resource "aws_internet_gateway" "main-gw" {
#    vpc_id = "${aws_vpc.main.id}"

#    tags {
#        Name = "main"
#    }
#}

#resource "aws_vpn_gateway" "vpn" {
#  amazon_side_asn = "4294967292"
#  vpc_id         = aws_vpc.main.id
#  tags = {
#    Env  = "AWS_native"
#    Name = "main-vpn-gateway"
#  }
#}

resource "aws_vpn_gateway_attachment" "vpn_attachment" {
  vpc_id         = aws_vpc.main.id
  vpn_gateway_id = aws_vpn_gateway.vpn.id
}

# route tables
resource "aws_route_table" "main-private" {
  depends_on = [aws_vpn_gateway.vpn]
  vpc_id     = aws_vpc.main.id

  route {
    cidr_block = var.vpn_cidr
    gateway_id = aws_vpn_gateway.vpn.id
  }
  tags = {
    Env  = "AWS_native"
    Name = "main-private-1"
  }
}

# route associations private
resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.main-private-1.id
  route_table_id = aws_route_table.main-private.id
}

resource "aws_route_table_association" "main-private-2-a" {
  subnet_id      = aws_subnet.main-private-2.id
  route_table_id = aws_route_table.main-private.id
}

