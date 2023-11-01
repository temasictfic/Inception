#!/bin/bash

echo "== Installing and setting up Wordpress =="

WP_DIR="/var/www/html/wordpress/"
WP_CONF="wp-config.php"

if [ ! -d $WP_DIR ]; then
    mkdir -p $WP_DIR
fi

if [ -d $WP_DIR ]; then
    cd $WP_DIR
    # Download
    wp --allow-root core download

    if [ ! -f $WP_DIR$WP_CONF ]; then
        wp --allow-root config create --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD
    fi
    # Create config file wp-config.php with the appropriate database parameters (these are env variables in the .env file)
    wp config create --allow-root --dbname=$DB_DATABASE --dbhost=$DB_HOST --dbprefix=wp_ --dbuser=$DB_USER_NAME --dbpass=$DB_USER_PASSWORD

    # Install wordpress for our website (again, variables are in the .env file)
    wp core install --allow-root --url=$DOMAIN_NAME --title="$WP_SITE_TITLE" --admin_user=$WP_ADMIN_NAME --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

    wp plugin update --allow-root --all

    # Create default user
    wp user create --allow-root $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD

    # Set the owner of the content of our site to www-data user and group
    # For security reasons, we want to restrict who has access to these files
    chown -R www-data:www-data $WP_DIR
fi

#mkdir -p /run/php/
php-fpm8.2 --nodaemonize
