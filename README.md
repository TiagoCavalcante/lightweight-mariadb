# lightweigth-mariadb
A MariaDB lightweight Docker container with ~143MB of size

## how to run
To run you need to:
* get the image:
  * downloading builded version:
    * `docker pull tiagotrindade/lightweight-mariadb`
  * building yourself:
    * `git clone https://github.com/TiagoCavalcanteTrindade/lightweight-mariadb`
    * `cd lightweight-mariadb`
    * `docker build -t tiagotrindade/lightweight-mariadb`
* create the container:
  * `docker run --name mariadb-server -d tiagotrindade/lightweight-mariadb`

## environment variables
The environment variables that you can set are:
* `MYSQL_ROOT_PASSWORD`: the MariaDB's root password, it defaults to `docker`
* `MYSQL_DATABASE`: a new MariaDB's database for user `MYSQL_USER`
* `MYSQL_CHARSET`: the `MYSQL_DATABASE`s charset, it defaults to `utf8mb4`
* `MYSQL_COLLATION`: the `MYSQL_DATABASE`s collation, it defaults to `utf8mb4_general_ci`
* `MYSQL_USER`: a new MariaDB's user with the password `MYSQL_PASSWORD`
* `MYSQL_PASSWORD`: `MYSQL_USER`'s password

## ports
The exposed ports are the following:
* `3306`: MariaDB's port

## how to save database content
To save MariaDB's content you need to mount a volume that binds to `/var/lib/mysql`

## how to configure
To configure MariaDB you need to:
* create a `cnf` file inside `/etc/mysql/conf.d`, e.g.:
  ```cnf
  [mysqld]
  default_authentication_plugin=mysql_native_password
  ```
* execute the following command: `sudo chmod 600 filename.cnf`

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
