# Local system configuration for back-end development

Local development system configuration with `Ansible` and `Docker`.

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
- Go
- PostgreSQL
- phpPgAdmin
- RabbitMQ
- NodeJs (NPM, Yarn, Gulp)

## Install Ansible

Run command for install ansible and ansible collection and roles.

```
./install.sh
```

## Secret for password

Create vault file with secret and change configuration:

```
openssl rand -base64 50 > .vault_password

cp inventory/host_vars/araz/vault.sample inventory/host_vars/araz/vault.yml

cat inventory/host_vars/araz/vault.yml  #Change content of vault file.

```

### Encrypt secret

```
ansible-vault encrypt inventory/host_vars/araz/vault.yml
```

### MongoDB KeyFile

For replica in mongodb create key file. By default MongoDB start standalone.

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

## Aliases

This aliases defined in bash configuration for easy access to container.

```
mongo --version # Mongosh shell
postgres --version # psql -U postgres --version
redis --version # Redis cli
nginx -v # nginx -t
mysql --version
php --version
composer --version
go version
rabbitmq --version  # same as rabbitmqctl
node --version
node npm --version
node yarn --version
node gulp --version
```

## NodeJS

Package can be install with `NPM` or `Yarn`

```
node npm i -f
node yarn --production=false

```

For serve application with npm:

```
export PORT=3008 && export HOST=0.0.0.0 && node npm run start
```

Default value for `PORT` is `3008` and `HOST` is `0.0.0.0`.

`env` variable `HOST` and `PORT` used for serving the application.

We pass `0.0.0.0` to HOST to expose application to outside of container. and serving with `PORT` in inside and outside of container.