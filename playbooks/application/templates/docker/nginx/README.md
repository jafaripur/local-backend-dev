# Nginx

Variable `php_project_path` set default for all PHP projects. for example about serve, If you have this path and wan to run on browser:

```
/home/test/projects
```

For running `test.php` in location `/home/test/projects/test.php` use this url:

```
http://localhost:8080/test.php
```

Default path run with php version is `8.1`.

If you have subfolder under /home/test/projects path you should create config file for that path in `docker_path/nginx/conf.d/subpath/`

This sample serve 3 application in subfolder in this path:

```
/home/test/projects/crow/backend/web
/home/test/projects/crow/frontend/web
/home/test/projects/crow/api/web

```

sample exist in `docker_file/nginx/conf.d/subpath/crow.conf` for `php-8.0`

```

location ^~ /crow/backend/web {
    error_log /var/log/nginx/crow-backend-error.log warn;
    access_log /var/log/nginx/crow-backend-access.log main if=$loggable;

    try_files $uri $uri/ /crow/backend/web/index.php$is_args$args;
    include snippets/php8-fpm.conf;
}

location ^~ /crow/frontend/web {
    error_log /var/log/nginx/crow-frontend-error.log warn;
    access_log /var/log/nginx/crow-frontend-access.log main if=$loggable;

    try_files $uri $uri/ /crow/frontend/web/index.php$is_args$args;
    include snippets/php8-fpm.conf;
}

location ^~ /crow/api/web {
    error_log /var/log/nginx/crow-api-error.log warn;
    access_log /var/log/nginx/crow-api-access.log main if=$loggable;

    try_files $uri $uri/ /crow/api/web/index.php$is_args$args;
    include snippets/php8-fpm.conf;
}

```

For `PHP-7.4` use this snippet:

```
snippets/php7-fpm.conf
```

For `PHP-8.1` use this snippet:

```
snippets/php81-fpm.conf
```