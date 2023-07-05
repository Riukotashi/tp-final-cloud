terraform {
  backend "s3" {
    bucket = "archi-cloud"
    key    = "tp-final.tfstate"
    region = "eu-west-3"
  }
}