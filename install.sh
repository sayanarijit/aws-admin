#!/bin/bash

# Installation path
INSTALLATION_DIR="/opt/aws-admin"
BIN_DIR="$INSTALLATION_DIR/bin"
DATABASE_DIR="$INSTALLATION_DIR/database"
KEYS_DIR="$DATABASE_DIR/keys"
SERVERS_DIR="$DATABASE_DIR/servers"
IGNORED_DIR="$DATABASE_DIR/ignored"

# Create directories
mkdir -p -v "$INSTALLATION_DIR" "$IGNORED_DIR" "$SERVERS_DIR" "$KEYS_DIR" "$DATABASE_DIR" "$BIN_DIR" || exit 1
echo

# Create group 'aws-admins'
groupadd aws-admins && usermod -a -G aws-admins root && echo "Created group 'aws-admins'" || exit 1
echo

# Copy script
cp -v aws-ssh "$BIN_DIR" && chown -R root:aws-admins "$INSTALLATION_DIR" && chmod -R 0770 "$INSTALLATION_DIR" || exit 1
echo

# Instructions
echo "SUCCESS: Successfully installed aws-admin"
echo
echo "NOTE: Only members of 'aws-admins' group will be able to see and modify files under '"$INSTALLATION_DIR"'"
echo
echo "LET'S GET STARTED: 1. Kindly copy all keys inside '"$KEYS_DIR"' directory with owner as 'root' and '400' permission"
echo "                   2. Add '"$BIN_DIR"' directory to 'root' user's PATH variable ('export PATH="$BIN_DIR:\$PATH"')"
echo "                   3. Give people permission to run 'sudo aws-ssh' ('%aws-admins ALL = "$BIN_DIR"/aws-ssh') in sudoers file"
echo "                   4. Run 'sudo aws-ssh <hostname>' to find and map the appropriate key for <hostname> in database"
echo "                   NOTE: For 1st time login to any server, it may take some time find the appropriate key"
