#!/bin/bash

# Reading Standard Input, Creating Accounts, Username Conventions, More Quoting.

read -p 'Enter username: ' USER_NAME
read -p 'Enter Real name of User: ' COMMENT
read -s -p 'Enter password: ' PASSWORD

sudo useradd -c "${COMMENT}" -m "${USER_NAME}"

sudo echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd

sudo passwd -e "${USER_NAME}"
