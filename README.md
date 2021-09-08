# Local system configuration for back-end development

## Stacks

Local development stacks:

- Nginx
- PHP-FPM
- PHP-CLI
- Composer
- MySQL
- PHPMyAdmin
- Redis
- Elasticsearch
- MongoDB

## Install Ansible

Run command for install ansible and ansible collection and roles.

```
./install.sh
```

## Secret for password

Create vault file with secret and change configuration:

```
openssl rand -base64 50 > .vault_password

cp inventory/host_vars/araz/vault_sample.yml inventory/host_vars/araz/vault.yml

cat inventory/host_vars/araz/vault.yml  #Change content of vault file.

```

### Encrypt secret

```
ansible-vault encrypt inventory/host_vars/araz/vault.yml
```

### MongoDB KeyFile

For replica in mongodb create key file.

```
openssl rand -base64 756 > playbooks/application/templates/docker/mongodb/config/keyfile

ansible-vault encrypt playbooks/application/templates/docker/mongodb/config/keyfile

```

## Configuration

Configuration available in `inventory/host_vars/araz/vars.yml`, Can change as need.

For example path of php projects folder to use in nginx or php-fpm change this variable: `php_project_path` or for docker files should be copy: `application_working_path`

## Running playbook

For first time system configuration use this playbook to apply changes:

```
ansible-playbook playbooks/all.yml -K
```

run this one for copy docker files:

```
ansible-playbook playbooks/application/docker.yml -K  # This can be run several time for update docker config or shell script.
ansible-playbook playbooks/application/logrotate.yml -K # This is for logrotate
```

Docker file available in this variable path `application_working_path` which is defined in host var file.

For PHP-CLI and composer alias defined:

```
php -v
composer --version
```