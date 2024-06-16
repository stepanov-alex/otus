#!/usr/bin/env fish

set inventory ".vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory"
set computer $argv[1]

vagrant up $computer
ansible-playbook -i $inventory ansible/ansible.yml --limit $computer
