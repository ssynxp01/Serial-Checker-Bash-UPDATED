#!/bin/bash

## Check if the program was started with root permisson
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
## Installing Figlet on the system, if its not present..
if ! which figlet > /dev/null; then
    read -p "Press any Key to intsall figlet, STRG+C to exit the process. (Figlet is requied to start the HWID Checker...)" 
    sudo apt-get install figlet -y
    echo
    clear
    echo "Paket installed successful, starting HWID Checker...."
    sleep 2 
fi

## Clearing the screen
clear

## Printing a AASCII Code with Figlet
figlet HWID CHECKER
sleep 2

## Waiting for user input
read -p "Press any Key to show your HWID"

## Printing CPU Information in console
echo "------------------------------------------------------------"
echo "CPU INFORMATION"
sleep 1
echo
sudo dmidecode | grep -w ID | sed "s/^.ID\: //g"
echo "------------------------------------------------------------"
echo "System Informationen (Serial Number included)"
sleep 1
echo
sudo dmidecode -t system 
echo "------------------------------------------------------------"
echo "GPU INFORMATION"
sleep 1 
echo 
sudo lspci | grep VGA
echo "------------------------------------------------------------"
echo "DISK INFORMATION"
sleep 1 
echo 
sudo smartctl -i /dev/nvme0n1
echo "------------------------------------------------------------"
echo "RAM INFORMATION"
sleep 1 
echo 
sudo lshw -c memory
echo "------------------------------------------------------------"
echo "MOTHERBOARD INFORMATION"
sleep 1 
echo
sudo dmidecode -t 2