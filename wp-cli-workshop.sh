#!/bin/bash

# Slides From the Workshop
# https://www.slideshare.net/4nd4p0p/wpcli-workshop-at-wordpress-meetup-clujnapoca


# WP-CLI example

# Download WP-CLI
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# check to make sure it worked
# php wp-cli.phar --info

# make it executable
# sudo chmod +x wp-cli.phar

# set file to path :$wp
# sudo mv wp-cli.phar /usr/local/bin/wp

# test that it's working
# wp --info


# ------CORE------

#  download WordPress
wp core download

# build the wp-config.php file
wp core config --dbname=anda --dbuser=root --dbpass=pass --dbhost=localhost --dbprefix=an_

# run install
wp core install --url=anda.local --title="Anda's Demo Site" --admin_user=admin --admin_password=password --admin_email=anda@example.com


# ------ OPTIONS ------

# list options that begin with site
wp option list --search="blog*"

wp option update blogdescription "Oh that was so fast!"

# discourage search engines
# wp option update blog_public 0

# ------POSTS------

# Generate some dummy posts
wp post generate --count=5 --post_date=2017-01-01

# Generate posts with fetched content.
curl http://loripsum.net/api/5/short/ul/headers | wp post generate --post_content --count=5

# ------USERS------

# create users with different roles
wp user create paula paula@example.com --role=author --user_pass=“password”

# Delete Bob
wp user delete paula

# ------THEMES------

# List current themes
wp theme list

# Let's install a new theme and go ahead and activate it
wp theme install twentytwelve --activate

# We can create our own child themes pretty quickly
wp scaffold child-theme twentyseventeen_child_theme --parent_theme=twentyseventeen --activate

# Add a post type
wp scaffold post-type movie --label=Movie --theme=twentyseventeen_child_theme
# make sure to include the created file in functions php
# require_once 'post-types/movie.php';

# check status
wp theme status

#------PLUGINS------#

# Install Yoast and activate it
wp plugin install wordpress-seo --activate

# Install An older version of a plugin
wp plugin install search-everything --version=8.1.6 --activate

# Test the version that a plugin will update to
wp plugin update search-everything --dry-run

# Update all the plugins
# wp plugin update --all

# Delete Hello plugin
wp plugin delete hello

# List all plugins
wp plugin list

#------Menus------#

# Create a new menu
wp menu create "primary-navigation"

# Add it to a location.  What menu locations were there?
wp menu location list

# Set the menu location
wp menu location assign my-menu top

# Create a menu link to a page
wp menu item add-post my-menu 2
# Create a menu link to a known address (google in this case)
wp menu item add-custom my-menu Slides https://www.slideshare.net/4nd4p0p/wpcli-workshop-at-wordpress-meetup-clujnapoca


# ------WIDGETS------

# Turn off the widgets.  All of them.
wp widget reset --all

# list all sidebar locations
wp sidebar list

# Add a Calendar widget
wp widget add calendar sidebar-1 1 --title="When did I write"


# -----Database-------
# Let's export the current DB
wp db export anda-db.sql


# Resetting the db: THIS WILL ERASE ALL DATA IN THE DB
# wp db reset
