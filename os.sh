#!/bin/bash

if [ -f /etc/redhat-release ]
then
  if [ -f /etc/fedora-release ]
  then
    echo "Fedora"
  elif [ -f /etc/centos-release ]
  then
    echo "CentOS"
  else
    echo "RHEL"
  fi

  yum install -y ruby-devel rubygems-devel gcc-c++ curl-devel rubygem-bundler
fi

if [ -f /etc/SuSE* ]
then
  echo "SUSE"
  zypper install -y rubygem-bundler ruby-devel gcc-c++ patch make
fi

if [ -f /etc/*debian* ]
then
  if grep -i ubuntu /etc/os-release &>/dev/null
  then
    echo "Ubuntu"
    #apt-get update && apt-get install -y ruby2.0 ruby2.0-dev libcurl4-openssl-dev
    echo "Ubuntu is not currently supported by this setup script."
    echo "Please install Docker and use the Docker setup script instead."
  else
    echo "Debian"
    apt-get update && apt-get install -y bundler
  fi
fi
