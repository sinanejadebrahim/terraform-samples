module "s3-bucket" {
  source = "../modules/s3/"


  # change these to your needs
  bucket = "test-bucket"
  env = "production"
}
