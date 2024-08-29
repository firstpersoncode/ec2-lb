bucket_name = "dev-jenkins-remote-state-bucket-66996699"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "dev-proj-jenkins-ap-southeast-vpc-1"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
ap_availability_zone = ["ap-southeast-1a", "ap-southeast-1b"]

public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkrroER64F2sM34lQfqgToFRmMz14NgFDND6eyLLE2T5AAu+i580ejIfMQZZEtAVMjLI6CRCN1yMDGH5puEoo+lYZmiEyDdZz8gSSsx1PkKa3dp2vX6Fplq0JqFUnrQVswN3qZvAzXYHFF5xGdo0GBhOjy90rrk/7bkz4xzSfKUuiTeZPKrXxdoWsshZf3XmpFJt3/FsX3SzQPR8IvBzKL3ApPyo7TlRSLZbnMAkVCZH6bT/TWfe7x11Rg3Srv5eBRCFHgFHhPzqQ7miF6szneIzEfVFSaHzXSDkg8rqBnfVdB0tcRkrS0fmhrASgwCUJSwn/YARU5ndI7jYYBoqzuUbgvCK2yJXsA8EYbXrKorMu6MCBolgpwQ5ii2Dba9cnTV7TbGXFhUYg7QCbJsb7UVtIa5joJYI/yLpieu+FZVqulezEATnf2ECQA24cY7nrFePGC6ycQsNvlQ3hIKXZMbVCodvoQlOY3dSHBMvZpvKzay3ro42pyfRgR+pr3fVk= nassermaronie@Nassers-MacBook-Pro.local"
ec2_ami_id = "ami-0497a974f8d5dcef8"