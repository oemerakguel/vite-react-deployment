resource "aws_key_pair" "deployer" {
  key_name   = "vite-deploy-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDFadD8DQ27srBBjPZKATUMS9YQgytGY2tsHPpUzFWborI8LR2JJKJeRLXAJRSA8NfMbe5MtxA4k61qWqabCXTrxk02CS3PSUBq/rb2rdlM7zI0Loyb2Bp0K69wJu4UwzRS+ZNrInhPzGY7tpCP01rsuJWQvnj5NyZ+UiYMmdeiCO9KlgZFfXJQB33NSrSrrrKO762chh/EVOchsIpEGehL7sD+zhuoQDz42sZPsDDgboMOu+dP2wuD/nRwLf5T7BafQm5w2emDPhRp/9etEddqpo4wqZLY2o1ko8YDADQiPYgfbJVac0nJQWBVLQYgHLoJXlEwiywzddJL/0uzmIIdmqotf3PSssu7SyqoIycIGZi5JOoDxjMu3nZamGYj/ooMgiW6x93GzdAVqMlpP4fWSpUsCWMx7MI0LTPN1uuVU9F9fpXbTzXOkYj1PdJg/i99Nr7PJTb1uqH4UELjVYouhnlRiMvQ4KGHGM1wQhm5Qy/FSn7wdONXtf7Vd5JVrrmW9J6IIdLFS/rBIml/xDKbKsMPLbPRsNkkJcf/SD5URHq8+wICYzMD3HwiLvZyZpGIVJpYI8gItDZhD4Ca/1Wm3ahmUFmy+kAS51S2fa45s3ymKuozmwblX9J8wjD55XF6WborCVyM3lr9zsVy6DcAlRZaQDb9t4drBTSZa8nuOw== moi@DESKTOP-VK39372"
}

resource "aws_instance" "web" {
  ami                         = "ami-0bdf93799014acdc4"  # Ubuntu 22.04 LTS eu-central-1 (fest)
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              mkdir -p /var/www/html
              chown -R ubuntu:ubuntu /var/www/html
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Deployment bereit!</h1>" > /var/www/html/index.html
            EOF

  tags = {
    Name = "ReactAppInstance"
  }
}
