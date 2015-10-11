#!/usr/bin/env bash

# Immediately exit if any commands fail.
set -e

# Config Variables

camp_path=/Applications/Camp

# Setup Camp

mkdir ${camp_path}
mkdir ${camp_path}/bin
mkdir ${camp_path}/lib
mkdir ${camp_path}/scripts

# Set the Camp folder icon
sh ./setIcon.sh assets/camp.png ${camp_path}

# Build Camp Terminal

# Compile the apple script into a .app
/usr/bin/osacompile -o ./tmp/Camp\ Terminal.app ./camp-terminal.scpt

# Set the icon
cp assets/terminal.icns ./tmp/Camp\ Terminal.app/Contents/Resources/applet.icns

# copy to the Camp path
mv ./tmp/Camp\ Terminal.app ${camp_path}/Camp\ Terminal.app

# copy the shell startup script
cp ./start.sh ${camp_path}/scripts/start.sh

pushd tmp

# Get SQLite

curl -LOk https://www.sqlite.org/2015/sqlite-shell-osx-x86-3081101.zip
unzip sqlite-shell-osx-x86-3081101.zip
cp sqlite3 ${camp_path}/bin/sqlite3

# Setup Psysh
curl -O http://psysh.org/psysh
chmod +x psysh
mv psysh ${camp_path}/bin


# Build PHP

php_version=5.6.10
php_dirname=php-${php_version}
php_archive_name=${php_dirname}.tar.gz
php_url=http://us.php.net/get/${php_archive_name}/from/this/mirror
php_path=${camp_path}/lib/php${php_version}

curl -L ${php_url} | tar xz

pushd ${php_dirname}

./configure \
    --enable-cli \
    --disable-cgi \
    --disable-all \
    --enable-json \
    --enable-phar \
    --enable-hash \
    --enable-filter \
    --enable-sockets \
    --enable-tokenizer \
    --with-openssl \
    --with-sqlite3=${camp_path}/bin \
    --with-readline \
    --enable-pdo \
    --enable-mbstring=all \
    --enable-posix \
    --with-pdo-sqlite=${camp_path}/bin \
    --prefix=${php_path} \
    --exec-prefix=${php_path} \
    --sysconfdir=${php_path}/conf \
    --with-config-file-path=${php_path}/conf


make
make install
popd

mkdir ${php_path}/conf/
cp ${php_dirname}/php.ini-development ${php_path}/conf/php.ini

popd

ln -s ${php_path}/bin/php ${camp_path}/bin/php

# Setup Composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=${camp_path}/bin --filename=composer

echo DONE