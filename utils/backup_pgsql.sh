#!/bin/sh

# This is a simple shell script to backup a PostgreSQL database with rsnapshot.
#
# The assumption is that this will be invoked from rsnapshot. Also, since it
# will run unattended, the user that runs rsnapshot (probably root) should have
# a .pgpass file in their home directory that contains the password for the
# postgres user.
#
# This script simply needs to dump a file into the current working directory.
# rsnapshot handles everything else.

# backup the database
/usr/local/pgsql/bin/pg_dumpall -Upostgres > pg_dumpall.sql

# make the backup readable only by root
/bin/chmod 600 pg_dumpall.sql