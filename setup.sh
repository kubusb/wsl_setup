#!/bin/bash
sudo apt -y update;
sudo apt -y upgrade;
sudo apt -y dist-upgrade

# install basic software
sudo apt install -y git perl python3 python3-pip dos2unix gnupg software-properties-common keychain

# Installing Ansible, dependent modules and helpers"
pip3 install requests ansible ansible-lint pywinrm

echo "# Replacing local .bashrc with shared one"
cp ./.bashrc ~/.bashrc
dos2unix ~/.bashrc
echo

# Ensuring whatever is in bashrc is actually applied
. ~/.bashrc

# Continuing setup from within ansible
export ANSIBLE_CONFIG=./wsl_setup/ansible.cfg && ansible-playbook ./wsl_setup/main.yml
echo