#! /bin/bash

#This script is used to install a LAMP server using case statements in Ubuntu

# update system

echo "Updating system..."

sudo apt-get update

# Functions to install LAMP

install_apache() {
if ! command -v apache2 &> /dev/null;
then
    echo "Apache is not installed. Installing..."
    sudo apt-get install apache2 -y
    echo "Apache installation was successful!"
else
    echo "Apache is already installed!"
fi
}

install_mysql() {
if ! command -v mysql &> /dev/null;
then
    echo "MySQL is not installed. Installing..."
    sudo apt install mysql-server -y
    echo "MySQL installation was successful!"
else
    echo "MySQL is already installed!"
fi
}

install_php() {
if ! command -v php &> /dev/null;
then
    echo "PHP is not installed. Installing..."
    sudo apt install php libapache2-mod-php -y
    echo "PHP installation was successful!"
else
    echo "PHP is already installed!"
fi

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












