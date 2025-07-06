terraform {
  backend "s3" {
    bucket         = "tf-remote-state"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    endpoint       = "http://localhost:4566"
    access_key     = "test"
    secret_key     = "test"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    force_path_style = true
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  s3_force_path_style         = true
  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "local_file" "shared" {
  content  = "This state is stored remotely!"
  filename = "shared.txt"
}
#state/terraform.tfstate