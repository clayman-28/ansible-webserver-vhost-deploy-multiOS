DEPLOY VIRTUAL HOSTS FOR APACHE2 OR NGINX

# About
This is an ansible playbook which automates virtual host deployment on existing or non-existing apache2 or nginx installation on Debian based or RedHat based systems.

# Overview
Requirements: \
    - Ansible 2.10+: [Ansible install documentation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) \
    - Make: [Installation guide](https://www.gnu.org/software/make/)

By default it's running on localhost only, but it can be configured to run on a different host. \
Run from the root folder after entering your hostname.
```shell
sed -i 's/hosts: localhost/hosts: <YOUR_HOSTNAME_HERE>/' main.yml
```

The installer will create letsencrypt certificate as well for your domain. \
!!! Thus please set your site's DNS record at your provider before starting (watch the TTL time) !!! \
\
Preparation: \
Go to the ansible workspace's root directory and create the variables for your vhost:
```shell
make variables
```

You'll be prompted to declare the following information:
```shell
# "apache2" or "nginx" is accepted only
webserver_type: string

# your site's FQDN (example.example.hu)
site_name: string

# which port is used by your running service
service_port: string

# which ip and protocol is the service running on? (example: protocol: http, server_ip: localhost)
protocol: string
server_ip: string

# e-mail address for letsencrypt certificate
e_mail: string
```

If all variables are set, you can run from the ansible workspace's root directory:
```shell
make vhost
```
