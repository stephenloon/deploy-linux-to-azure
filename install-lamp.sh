#! /bin/bash

#This script is used to install a LAMP server using case statements

# update system

echo "Updating system..."

sudo apt-get update

# Functions to install LAMP

install_apache() {
    sudo apt-get install apache2 -y
}

install_mysql() {
    sudo apt install mysql-server -y
    sudo mysql_secure_installation
}

install_php() {
    sudo apt install php libapache2-mod-php -y

}

restart_apache() {
    sudo /etc/init.d/apache2 restart

}

# Main script

echo "LAMP Stack Installation"

while true;
do
    read -p "Select an option: [1] Apache [2] MySQL [3] PHP [4] Restart Apache [5] Quit: " choice
    case $choice in
        1) install_apache;;

        2) install_mysql;;

        3) install_php;;

        4) restart_apache;;

        5) echo "Quitting..."
            break;;
        *) echo "Invalid option. Please select something else";;

    esac
done

# Define the Functions
install_apache
install_mysql
install_php
restart_apache










