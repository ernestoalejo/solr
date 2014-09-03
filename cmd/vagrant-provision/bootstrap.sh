#!/bin/bash

# Exit as soon as a command errors out
set -e

# Alert of undefined variables
set -u

echo " [*] Add new repos..."
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update

echo " [*] Install packages..."
sudo apt-get install -y unzip curl xclip git mercurial bzr subversion aptitude

echo " [*] Update system..."
sudo aptitude update
sudo aptitude -y upgrade

echo " [*] Install linux image extras..."
sudo aptitude install linux-image-extra-`uname -r` -y

echo " [*] Import Docker repo key..."
sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"

echo " [*] Add Docker repo..."
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo aptitude update

echo " [*] Install Docker..."
sudo aptitude install lxc-docker -y

# WARNING: It changes current directory to /vagrant
# We have to deactivate flags so bashrc doesn't return errors.
set +e
set +u

echo " [*] Copy the new bashrc and load it..."
rm ~/.bashrc
cp /vagrant/cmd/vagrant-provision/.bashrc ~/.bashrc
source ~/.bashrc

set -u
set -u

echo " [*] Configure Git correctly..."
git config --global push.default matching
git config --global --unset-all init.templatedir
