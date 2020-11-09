mysql_install_db --user=mysql --ldata=/var/lib/mysql

:> /tmp/sql

echo "CREATE DATABASE IF NOT EXISTS 'wordpress' CHARACTER SET utf8 COLLATE utf8_general_ci;" >> /tmp/sql
echo "SET PASSWORD FOR 'mysql'@'localhost'=PASSWORD('pass') ;" >> /tmp/sql
echo "GRANT ALL ON *.* TO 'mysql'@'127.0.0.1' IDENTIFIED BY 'pass' WITH GRANT OPTION;" >> /tmp/sql
echo "GRANT ALL ON *.* TO 'mysql'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;" >> /tmp/sql
echo "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;" >> /tmp/sql
echo "FLUSH PRIVILEGES;" >> /tmp/sql

/usr/bin/mysqld --console --init_file=/tmp/sql
