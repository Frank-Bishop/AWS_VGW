variable "CGWS" {
default = {
    CGW1 = {
      name       = "cgw1"
      bgp_asn    = "65412"
      ip_address = "1.2.3.4"
    },
    "CGW2" = {
      name       = "cgw2"
      bgp_asn    = "65412"
      ip_address = "2.2.3.4"
    },
    "CGW3" = {
      name       = "cgw3"
      bgp_asn    = "65412"
      ip_address = "3.2.3.4"
    },
    "CGW4" = {
      name       = "cgw4"
      bgp_asn    = "65412"
      ip_address = "4.2.3.4"
    }
 }
}
variable "VPNS" {
  default = {
    "VPN1" = {
      "name"       = "vpn1"
      "tunnel_key1"    = "test1234"
      "tunnel_key2"    = "test5678"
    "cgw" = "CGW1"
    },
    "VPN2" = {
      "name"       = "vpn2"
      "tunnel_key1"    = "test1234"
      "tunnel_key2"    = "test5678"
    "cgw" = "CGW2"
    },
    "VPN3" = {
      "name"       = "vpn3"
      "tunnel_key1"    = "test1234"
      "tunnel_key2"    = "test5678"
    "cgw" = "CGW3"
    },
    "VPN4" = {
      "name"       = "vpn4"
      "tunnel_key1"    = "test1234"
      "tunnel_key2"    = "test5678"
    "cgw" = "CGW4"
    },
    }
}



variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1    = "ami-13be557e"
    us-west-2    = "ami-06b94666"
    eu-west-1    = "ami-844e0bf7"
    eu-central-1 = "ami-027583e616ca104df"
  }
}

variable "vpn_cidr" {
  default = "0.0.0.0/0"
}

variable "pub1_cidr" {
  default = "10.0.111.0/24"
}

variable "pub2_cidr" {
  default = "10.0.2.0/24"
}

variable "priv1_cidr" {
  default = "10.0.1.0/24"
}

variable "priv2_cidr" {
  default = "10.0.2.0/24"
}

variable "vpc_cidr" {
  default = "10.0.0.0/22"
}

variable "tun1_cidr1" {
  default = "169.254.255.0/30"
}

variable "tun1_cidr2" {
  default = "169.254.255.4/30"
}

variable "tun2_cidr1" {
  default = "169.254.255.8/30"
}

variable "tun2_cidr2" {
  default = "169.254.255.12/30"
}

variable "tun1_key1" {
  default = "asdlknfkanlkansflk"
}

variable "tun1_key2" {
  default = "sdlafelfnkefnjkbjb"
}

variable "tun2_key1" {
  default = "asdlknfkanlkansflk"
}

variable "tun2_key2" {
  default = "sdlafelfnkefnjkbjb"
}

variable "tun3_key1" {
  default = "asdlknfkanlkansflk"
}

variable "tun3_key2" {
  default = "sdlafelfnkefnjkbjb"
}

variable "tun4_key1" {
  default = "asdlknfkanlkansflk"
}

variable "tun4_key2" {
  default = "sdlafelfnkefnjkbjb"
}

variable "on_prem_asn" {
  default = "65071"
}

variable "cgw1_ip" {
  default = "195.228.45.144"
}

variable "cgw2_ip" {
  default = "195.228.45.145"
}

variable "cgw3_ip" {
  default = "195.228.45.144"
}

variable "cgw4_ip" {
  default = "195.228.45.145"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

