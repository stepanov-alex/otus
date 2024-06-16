#!/usr/bin/fish

export inventory=.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

/usr/bin/ansible-playbook -i $inventory ansible/ansible.yml --limit $1
