module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  subnet_id     = module.network.subnet_id
  sg_id         = module.security.sg_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = templatefile("${path.module}/userdata.sh", {
    github_repo = var.github_repo
  })
}

module "backup" {
  source = "./modules/backup"
}
