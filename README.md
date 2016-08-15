## Camp

[![Build Status](https://travis-ci.org/yuloh/camp.svg?branch=master)](https://travis-ci.org/yuloh/camp)
[![Download Stable](https://img.shields.io/badge/download-0.1-green.svg)](https://github.com/yuloh/camp/releases/tag/0.1)


A Simple PHP Development Environment For OSX

![camp terminal screenshot](docs/assets/camp-terminal.png?raw=true)

## Introduction

Camp is an easy to install, zero configuration alternative to Mamp and Vagrant for learning modern PHP development.  Instead of forcing you to learn about web servers and virtual machines, Camp lets you focus on PHP.

You can read the blog post about why I built camp on [my blog](http://mattallan.org/2016/01/16/camp.html).

### What's Inside

- PHP 5.6.10
- Sqlite 3
- [Composer](https://getcomposer.org/)
- [Psysh](http://psysh.org/)

## Getting Camp

### Download the DMG

First you need to download the camp-installer.dmg file [from here](https://github.com/matthew-james/camp/releases/latest).

### Drag To Install

Double click the downloaded file, then drag and drop Camp to your applications folder.

![camp installer screenshot](docs/assets/camp-installer.png?raw=true)

## Using Camp

### Launching Camp Terminal

You interact with Camp through the Camp Terminal.  You can find it in the `/Applications/Camp` directory.

#### Unidentified Developer Warning

Until I pay Apple $99 per year, the camp terminal is going to give you a warning dialog and not let you launch the terminal.  [Follow these instructions to launch it](https://support.apple.com/kb/ph18657?locale=en_US).

### PHP

Once you launch the Camp Terminal, you can type `php -v` to see what version you are running.

#### Psysh

To play around with PHP from the shell, you use [psysh](http://psysh.org/).  Just type `psysh`, press enter, and you should be at a prompt ike this:

```bash
➜  ~  psysh
Psy Shell v0.6.0-dev (PHP 5.6.14 — cli) by Justin Hileman
>>> 
```

Now you can run PHP code!  Type this statement and press enter:

```php
echo "hello world!"
```

You should see something like this:

```bash
➜  ~  psysh
Psy Shell v0.6.0-dev (PHP 5.6.14 — cli) by Justin Hileman
>>> echo "hello world!"
hello world!⏎
=> null
>>> 
```

#### Composer

[Composer](https://getcomposer.org/) let's you download 'packages' of other peoples code and use them in your projects.  You can also use it to install more PHP programs like psysh that you run from the shell.

Type `composer --help` for more info.

#### Sqlite

Sqlite is a tiny database you can use to let your apps save stuff.  To use it from the terminal, just type `sqlite3`.
