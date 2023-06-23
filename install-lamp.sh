#! /bin/bash

#This script is used to install a LAMP server using case statements in Ubuntu

# update system

echo "Updating system..."

sudo apt-get update

# Functions to install LAMP

install_apache() {
    sudo apt-get install apache2 -y
}

install_mysql() {
    sudo apt install mysql-server -y
}

install_mysql_secure() {
    sudo mysql_secure_installation

    # if you get this error " Failed! Error: SET PASSWORD has no significance for user 'root'@'localhost...."
    # exit the set up
    # enter "sudo mysql"
    # enter this: ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'new_password';
    # enter desired password in 'new_password'
    # follow the prompts after
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
    read -p "Select an option: [1] Apache [2] MySQL [3] MySQL Secure [4] PHP [5] Restart Apache [6] Quit: " choice
    case $choice in
        1) install_apache;;

        2) install_mysql;;

        3) install_mysql_secure;;

        4) install_php;;

        5) restart_apache;;

        6) echo "Quitting..."
            break;;
        *) echo "Invalid option. Please select something else";;

    esac
done












