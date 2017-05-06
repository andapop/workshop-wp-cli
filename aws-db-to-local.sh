#!/bin/bash
#
# Make sure this file is in the wordpress root folder

echo "Exporting db"
wp --ssh=andaaws/var/www/html/  db export --allow-root /var/www/html/wp-content/anda-db.sql

echo "Copy aws db to local"
scp andaaws:/var/www/html/wp-content/anda-db.sql wp-content/
wait

echo "Importing the db"
wp db import wp-content/anda-db.sql
wait

echo "Doing the search-replace"
wp search-replace 'ec2-xx-xx-xxx-xxx.eu-central-1.compute.amazonaws.com' 'anda.local'

echo "Done"