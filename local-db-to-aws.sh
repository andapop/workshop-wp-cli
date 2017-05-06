#!/bin/bash
#
# Make sure this file is in the wordpress root folder

echo "Exporting local db"
wp db export --allow-root anda-db.sql

echo "Copy local db to aws"
scp anda-db.sql andaaws:/var/www/html/wp-content/
wait

echo "Importing the db"
wp --ssh=andaaws/var/www/html/  db import /var/www/html/wp-content/anda-db.sql
wait

echo "Doing the search-replace"
wp --ssh=andaaws/var/www/html/  search-replace 'anda.local' 'ec2-xx-xx-xxx-xxx.eu-central-1.compute.amazonaws.com'

echo "Done"
#ssh andaaws "sudo rm -rf /var/www/html/wp-content/anda-db.sql"