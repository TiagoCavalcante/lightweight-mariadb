# lightweigth-mariadb
A MariaDB lightweight Docker container with ~143MB of size

## how to run
Execute the commands bellow:
```bash
docker pull tiagotrindade/lightweight-mariadb
docker run --name mariadb-server -d tiagotrindade/lightweight-mariadb
```

## environment variables
The environment variables that you can set are:
* `MYSQL_ROOT_PASSWORD`: the MariaDB's root password, it defaults to `docker`
* `MYSQL_DATABASE`: a new MariaDB's database for user `MYSQL_USER`
* `MYSQL_USER`: a new MariaDB's user with the password `MYSQL_PASSWORD`
* `MYSQL_PASSWORD`: `MYSQL_USER`'s password

## ports
The exposed ports are the following:
* `3306`: MariaDB's port

## how to save database content
To save MariaDB's content you need to mount a volume called in `/var/lib/mysql`

## how to configure
To configure MariaDB you need to create a file inside `/etc/mysql/conf.d`

## docker compose sample file
```yaml
version: '3'

services:
  mariadb:
    image: tiagotrindade/lightweight-mariadb
    environment:
      - 'MYSQL_ROOT_PASSWORD=test'
    ports:
      - '3306:3306'
    volumes:
      - ./etc/mysql/conf.d/my.cnf:/etc/mysql/conf.d/my.cnf
      - ./var/lib/mysql:/var/lib/mysql
```