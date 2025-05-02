1. install five packages
- apache2
- php
- php-apache
- phpmyadmin
- mariadb,mysql
apahe to serve all
php is server side scripting language
sql is database language for store
phpmyadmin is php gui for sql
adminer is php gui for sql

DBeaver is node.js gui for sql
mysql workbench is node.js gui for sql

### technologies
apache = php in server = webserver
node.js = js in server = js runtime
jvm = java virtual machine


### client side
html
css
js

tsx

xml

### server side
php
js

java

### database
sql




xml
java


larvael
symfony
codeigniter

express.js
react.js





```bash
apt install apache2 php php-apache phpmyadmin mariadb -y
```

2. To start apache webserver

```bash
httpd
```

open browser and type `localhost:8080`
so,you see an html it works which is present usr/share/apache2/default-size/htdocs/index.html





To stop webserver use command
```bash
killall httpd
```

so,the site can't be reached

now we use php in webserver so,

```bash
cd $PREFIX/share/apache2/default-site/htdocs

```



``` optional
ls
cat index.html
```

rm rf index.html
place a index.php but apache web server can't read php so configure apache with php installed

3.

```
cd ..
cd usr/etc/apache2
nvim httpd.conf
```

```
at 
66 line uncomment  
67 line comment
add line
LoadModule php_module libexec/apache2/libphp.
```

and  at last

```

#set handler for php to understand .php files

<FilesMatch \.php$>
          SetHandler application/x-httpd-php
</FilesMatch>

#Load php module config
Include etc/apache2/extra/php_module.conf



```

save and exit the file
then you see new folder named extra in httpd.conf directory


```
cd extra
touch php_module.conf
```


start apache server by httpd command and you see index.php in localhost:8080

you sucessfully did apache webserver with php.


4. now,phpmyadmin
cd ..
cd usr/share/phpmyadmin

231 line on Directory tag on statment required all  denied and  change denied into granted

uncomment  
include etc/apache2/extra/httpd-vhosts.conf


save and exit


cd extra
nvim httpd-vhosts.conf

change 
1st virtual host tag server is localhost which opens web content


virtualHost :8080
DocumentRoot "/data/data/com.termux/files/usr/share/apache2/default-site/htdocs"
ServerName "localhost"

2nd virtual host tag server is phpmyadmin

DocumentRoot "/data/data/com.termux/files/usr/share/phpmyadmin"
ServerName "0.0.0.0"


now see 
localhost:8080
0.0.0.0:8080


mysqld  to start sql server



login phpmyadmin with username root and password root


mysql 
root
root
\q


killall httpd
killall mysqld


reference

- Tamp web server: https://github.com/1Tech-X/Tamp
- https://youtu.be/0ytASgBK8uA?si=v4GdG9aXvLF_LV8k