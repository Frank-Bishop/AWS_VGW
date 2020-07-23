resource "aws_customer_gateway" "cust_gw11" {
  bgp_asn    = "65071"
  ip_address = "195.228.45.146"
  type       = "ipsec.1"
    tags = {
    Env =  "AWS_native"
    Name = "customer_gw11"
    }
}

resource "aws_customer_gateway" "cust_gw12" {
  bgp_asn    = "65071"
  ip_address = "195.228.45.146"
  type       = "ipsec.1"
    tags = {
    Env =  "AWS_native"
    Name = "customer_gw12"
    }
}

resource "aws_customer_gateway" "cust_gw21" {
  bgp_asn    = "65071"
  ip_address = "195.228.45.144"
  type       = "ipsec.1"
    tags = {
    Env =  "AWS_native"
    Name = "customer_gw21"
    }
}

resource "aws_customer_gateway" "cust_gw22" {
  bgp_asn    = "65071"
  ip_address = "195.228.45.144"
  type       = "ipsec.1"
    tags = {
    Env =  "AWS_native"
    Name = "customer_gw22"
    }
}


resource "aws_vpn_connection" "ipsec1" {
depends_on = ["aws_vpn_gateway.vpn","aws_vpn_gateway.shared_vpn"]
#  transit_gateway_id = "${aws_ec2_transit_gateway.my-test-tgw.id}"
vpn_gateway_id      = "${aws_vpn_gateway.vpn.id}"
tunnel1_preshared_key = "${var.tun1_key1}"
tunnel2_preshared_key = "${var.tun1_key2}"
  customer_gateway_id = "${aws_customer_gateway.cust_gw11.id}"
  static_routes_only  = "false"
  tunnel1_inside_cidr = "${var.tun1_cidr1}"
  tunnel2_inside_cidr = "${var.tun1_cidr2}"
  type                = "ipsec.1"
    tags = {
    Env =  "AWS_native"
    Name = "vpn_connection1"
    }
}


resource "aws_vpn_connection" "ipsec2" {
#  transit_gateway_id = "${aws_ec2_transit_gateway.my-test-tgw.id}"
depends_on = ["aws_vpn_gateway.vpn","aws_vpn_gateway.shared_vpn"]
vpn_gateway_id      = "${aws_vpn_gateway.vpn.id}"
  customer_gateway_id = "${aws_customer_gateway.cust_gw12.id}"
  static_routes_only  = "false"
  tunnel1_inside_cidr = "${var.tun2_cidr1}"
  tunnel2_inside_cidr = "${var.tun2_cidr2}"
    type                = "ipsec.1"
    tags = {
    Env =  "AWS_native"
    Name = "vpn_connection2"
    }
}

