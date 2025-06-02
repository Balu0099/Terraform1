resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_subnet" "public-subnet3" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet3"
  }
}

resource "aws_subnet" "public-subnet4" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet4"
  }
}

resource "aws_subnet" "public-subnet5" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet5"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet"
  }
}

resource "aws_subnet" "private-subnet1" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.7.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.8.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet2"
  }
}

resource "aws_subnet" "private-subnet3" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.9.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet3"
  }
}

resource "aws_subnet" "private-subnet4" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet4"
  }
}

resource "aws_subnet" "private-subnet5" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = true
  tags = {
    Name = "private-subnet5"
  }
}

resource "aws_internet_gateway" "my-gateway" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-gateway"
  }
}
resource "aws_eip" "my-eip" {

}
resource "aws_nat_gateway" "my-nat-gateway" {
  allocation_id = aws_eip.my-eip.id
  subnet_id     = aws_subnet.public-subnet.id
  tags = {
    Name = "my-nat-gateway"
  }

}
resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my-route-table"
  }
}
resource "aws_route" "my-route" {
  route_table_id         = aws_route_table.my-route-table.id
  destination_cidr_block = "0.0.0/0"
  gateway_id             = aws_internet_gateway.my-gateway.id   
}
resource "aws_route" "my-nat-route" {
  route_table_id         = aws_route_table.my-route-table.id
  destination_cidr_block = "0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my-nat-gateway.id
}