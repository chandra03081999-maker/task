#!/bin/bash
set -eux

apt update -y
apt install -y docker.io docker-compose git

systemctl enable docker
systemctl start docker

mkdir -p /opt/jenkins_home

cd /opt

git clone ${github_repo} jenkins-docker

cd jenkins-docker

docker-compose up -d
