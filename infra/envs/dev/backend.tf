# Backend blocks cannot reference variables or locals, so these values are
# hardcoded. If you change region, change it here AND in variables.tf AND in
# the CLI commands from the Day 6 README.
terraform {
  backend "s3" {
    bucket       = "notes-api-tfstate-zak" # <-- replace
    key          = "dev/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true # native S3 locking; replaces the deprecated dynamodb_table
  }
}
