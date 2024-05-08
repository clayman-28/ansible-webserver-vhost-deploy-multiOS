# Makefile to run Ansible playbook with a custom target

# Target for vhost
vhost:
	ansible-playbook main.yml -K

# Target for variables
variables:
	ansible-playbook tasks/create_variables.yml
