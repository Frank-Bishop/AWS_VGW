# AWS VGW Playground
This is a basic TF Template for 
 - App VPC creation
 - VGW Creation
 - VGW and VPN tunnel associations
 - 2 security group 
 - 2 private subnet per VPC
 - 2 routing table (Main,PRIVATE)
 - VPN GW with 2 private subnet
 - 4x CGW (AWS Customer Gateway)
 - 4 vpn connection (8x IPsec) to On-prem connectivity
 - 4byte ASN for TGW and VGW

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| AMIS | n/a | `map` | <pre>{<br>  "eu-central-1": "ami-027583e616ca104df",<br>  "eu-west-1": "ami-844e0bf7",<br>  "us-east-1": "ami-13be557e",<br>  "us-west-2": "ami-06b94666"<br>}</pre> | no |
| AWS\_REGION | n/a | `string` | `"eu-central-1"` | no |
| INSTANCE\_USERNAME | n/a | `string` | `"ubuntu"` | no |
| PATH\_TO\_PRIVATE\_KEY | n/a | `string` | `"mykey"` | no |
| PATH\_TO\_PUBLIC\_KEY | n/a | `string` | `"mykey.pub"` | no |
| priv1\_cidr | n/a | `string` | `"10.0.1.0/24"` | no |
| priv2\_cidr | n/a | `string` | `"10.0.2.0/24"` | no |
| pub1\_cidr | n/a | `string` | `"10.0.111.0/24"` | no |
| pub2\_cidr | n/a | `string` | `"10.0.2.0/24"` | no |
| shared\_priv1\_cidr | n/a | `string` | `"10.40.22.0/25"` | no |
| shared\_priv2\_cidr | n/a | `string` | `"10.40.22.128/25"` | no |
| shared\_vpc\_cidr | n/a | `string` | `"10.40.22.0/24"` | no |
| tun1\_cidr1 | n/a | `string` | `"169.254.255.0/30"` | no |
| tun1\_cidr2 | n/a | `string` | `"169.254.255.4/30"` | no |
| tun2\_cidr1 | n/a | `string` | `"169.254.255.8/30"` | no |
| tun2\_cidr2 | n/a | `string` | `"169.254.255.12/30"` | no |
| vpc\_cidr | n/a | `string` | `"10.0.0.0/22"` | no |
| vpn\_cidr | n/a | `string` | `"0.0.0.0/0"` | no |
| vpn\_gw\_id | n/a | `string` | `"vgw-0d4b2f846b7512011"` | no |

## Outputs

No output.
