module "ec2" {
  source = "../modules/ec2"


  # change these to your needs
  os_ami          = "ami-12345678"
  size            = "t2.micro"
  name            = "my-ec2"
  public_key_path = "/root/.ssh/id_rsa.pub"
}
