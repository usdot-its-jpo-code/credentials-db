#!/bin/bash -xe

ADMINS_SCRIPT=/docker-entrypoint-initdb.d/init-admins.sql
USERS_SCRIPT=/docker-entrypoint-initdb.d/init-users.sql


echo '' > $ADMINS_SCRIPT
echo '' > $USERS_SCRIPT

echo 'USE '$MYSQL_DATABASE';' >> $ADMINS_SCRIPT
echo 'CREATE TABLE `'$ADMINS_TABLE_NAME'` (' >> $ADMINS_SCRIPT
echo '  `'$USERNAME_COLUMN_NAME'` '$USERNAME_COLUMN_TYPE' NOT NULL,' >> $ADMINS_SCRIPT
echo '  PRIMARY KEY (`'$USERNAME_COLUMN_NAME'`)' >> $ADMINS_SCRIPT
echo ');' >> $ADMINS_SCRIPT

echo 'USE '$MYSQL_DATABASE';' >> $USERS_SCRIPT
echo 'CREATE TABLE `'$USERS_TABLE_NAME'` ( ' >> $USERS_SCRIPT
echo '  `'$USERNAME_COLUMN_NAME'` '$USERNAME_COLUMN_TYPE' NOT NULL DEFAULT '\'\'',' >> $USERS_SCRIPT
echo '  `'$PASSWORD_COLUMN_NAME'` '$PASSWORD_COLUMN_TYPE' DEFAULT NULL,' >> $USERS_SCRIPT
echo '  PRIMARY KEY (`'$USERNAME_COLUMN_NAME'`)' >> $USERS_SCRIPT
echo ');' >> $USERS_SCRIPT

/mysql-docker-entrypoint.sh $@