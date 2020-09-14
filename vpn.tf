
#resource "aws_customer_gateway" "cust_gw22" {
#  bgp_asn    = var.on_prem_asn
#  ip_address = var.cgw4_ip
#  type       = "ipsec.1"
#  tags = {
#    Env  = "AWS_native"
#    Name = "customer_gw22"
#  }
#}

resource "aws_customer_gateway" "cust_gw" {
for_each = var.CGWS
  bgp_asn    = each.value["bgp_asn"]
  ip_address = each.value.ip_address
  type = "ipsec.1"
  tags = {
    Env  = "AWS_native"
    Name = each.value.name
  }
}

resource "aws_vpn_connection" "ipsec" {
  depends_on = [aws_vpn_gateway.vpn]
for_each = var.VPNS
  vpn_gateway_id        = aws_vpn_gateway.vpn.id
  tunnel1_preshared_key = each.value.tunnel_key1
  tunnel2_preshared_key = each.value.tunnel_key2
 customer_gateway_id   = aws_customer_gateway.cust_gw[each.value.cgw].id
  static_routes_only    = "false"
  #  tunnel1_inside_cidr = "${var.tun1_cidr1}"
  #  tunnel2_inside_cidr = "${var.tun1_cidr2}"
  type = "ipsec.1"
  tags = {
    Env  = "AWS_native"
    Name = each.value.name
  }
}




#resource "aws_vpn_connection" "ipsec4" {
#  depends_on = [aws_vpn_gateway.vpn]
#  vpn_gateway_id        = aws_vpn_gateway.vpn.id
#  tunnel1_preshared_key = var.tun4_key1
#  tunnel2_preshared_key = var.tun4_key2
#  customer_gateway_id   = aws_customer_gateway.cust_gw21.id
#  static_routes_only    = "false"
#  #  tunnel1_inside_cidr = "${var.tun1_cidr1}"
#  #  tunnel2_inside_cidr = "${var.tun1_cidr2}"
#  type = "ipsec.1"
#  tags = {
#    Env  = "AWS_native"
#    Name = "vpn_connection4"
#  }
#}


output "cgw-ids" {
    value = [for u in aws_customer_gateway.cust_gw:u.id]
    description = "return a list of CGW-IDs"
}

output "cgw-name-tags" {
    value = {
	for u in aws_customer_gateway.cust_gw:
	u.id => u.tags.Name 
    }
    description = "return a list of Name tags associated to each CGWs"
}


output "cgw-ips" {
    value = {
	for u in aws_customer_gateway.cust_gw:
	u.id => u.ip_address 
    }
    description = "return a list of IPs associated to each CGWs"
}

output "cgw-bgp-asn" {
    value = {
	for u in aws_customer_gateway.cust_gw:
	u.id => u.bgp_asn 
    }
    description = "return a list of ASN associated to each CGW"
}

output "vpn-ids" {
    value = [for u in aws_vpn_connection.ipsec:u.id]
    description = "return a list of VPN-IDs"
}

output "vpn-name-tags" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.customer_gateway_id 
    }
    description = "list, display VPN Connection Name tags"
}

output "vpn-name-mappings" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tags.Name 
    }
    description = "list, display how the VPNs associated to CGWs"
}

output "vpn-tunnel1-address" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel1_address
    }
    description = "list of IPs: AWS tunnel2 outside IP address associated to each VPN connection"

}

output "vpn-tunnel2-address" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel2_address
    }
    description = "list of IPs: AWS tunnel2 outside IP address associated to each VPN connection"
}


output "vpn-tunnel1-inside-cgw-address" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel1_cgw_inside_address
    }
    description = "list of IPs: CGW tunnel1 intside IP address associated to each VPN connection"
}

output "vpn-tunnel1-inside-vgw-address" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel1_vgw_inside_address
    }
    description = "list of IPs: VGW tunnel1 inside IP address associated to each VPN connection"
}

output "vpn-tunnel2-inside-cgw-address" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel2_cgw_inside_address
    }
    description = "list of IPs: CGW tunnel2 inside IP address associated to each VPN connection"
}

output "vpn-tunnel2-inside-vgw-address" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel2_vgw_inside_address
    }
    description = "list of IPs: VGW tunnel2 inside IP address associated to each VPN connection"
}

output "vpn-tunnel1-bgp-asn" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel1_bgp_asn
    }
    description = "list of tunnel1 ASN associated to each VPN connection"
}
output "vpn-tunnel2-bgp-asn" {
    value = {
	for u in aws_vpn_connection.ipsec:
	u.id => u.tunnel2_bgp_asn
    }
    description = "list of tunnel2 ASN associated to each VPN connection"
}

