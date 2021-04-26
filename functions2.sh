#! /bin/bash

function EditUser(){
 clear
echo "Choose option!"
echo -e "1.Edit name of user\n2.Edit UID of user\n3.Edit GID of user"
read choose
case "$choose" in
        1)echo "Enter New name for user"
                read newname
                echo "Enter Old name of user"
                read oldname
                sudo usermod -l $newname $oldname;;
        2)echo "Enter name of user"
                read name
                echo "Enter New UID for $name"
                read newuid
                echo "Enter Old UID of user"
                sudo usermod -u $newuid $name;;
        3) echo "Enter name of user"
                read name
                echo "Enter New GID for $name"
                read newgid
                echo "Enter Old GID of user"
                sudo usermod -g $newgid $name;;

esac
echo "========="
}

function DeleteUser(){
        clear
echo "Enter name of user which you want to delete"
read name
sudo userdel -r $name
echo "============"
}

function DeleteGroup(){
        clear
echo "Enter name of group which you want to delete"
read group
sudo groupdel $group
echo "==========="
}

function CreateUser(){
clear
echo "Enter name of new user"
read name
echo "Choose option!"
echo -e "1.Create new user with name only\n2.Create new user with name and UID\n3.Create new user with name and UID and GID\n"
read choose
case "$choose" in
        1)sudo useradd $name;;
        2)echo "enter UID for $name"
                read uid
                sudo useradd -u $uid $name;;
        3)echo "enter UID and GID for $name"
                read uid
                read gid
                sudo useradd -u $uid -g $gid $name;;
        *)echo "select true option!";;

esac
echo "=========="
}

function CreateGroup(){
        clear
echo "Choose option"
echo -e "1.Create group with name only \n2. Create group with name and GID"
read Choose
echo "Enter name of group"
read name
case "$Choose" in
        1)sudo groupadd $name;;
        2)echo "Enter GID of group"
                read GID; sudo groupadd $name -g $GID;;
        *)echo "Select true option";;

esac
echo "=========="
}

function EditGroup(){
        clear
echo "Choose option"
echo -e "1.Edit name\n2.Edit GID"
read choose
case "$choose" in
        1)echo "Enter New name of group"
                read newname
                echo "Enter Old name of group"
                read oldname
                sudo groupmod -n $newname $oldname;;
        2)
                echo "Enter name of group"
                read groupname
                echo "Enter New GID of group"
                read GID
                sudo groupmod -g $GID $groupname;;
        *)echo "Select true option";;
esac
echo "============"
}
function ShowListAllGroup(){
sudo less /etc/group
}

function ShowGroupByName(){
        clear
echo "Enter name of group"
read name
cat /etc/group | grep $name
echo "============== "
}

function ShowListAllUser(){
sudo less /etc/passwd
}
function ShowUserByName(){
        clear
echo "Enter name of user"
read name
cat /etc/passwd | grep $name
echo "============== "
}

