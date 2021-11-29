#!/bin/bash

# This script is designed to find Hosts with open Ports.

echo "Enter starting IP Address : "
read FirstIP

echo "Enter the last octet of the last IP address : "
read LastOctetIP

echo " Enter the port number you want to scan for : "
read port

nmap -sS $FirstIP-$LastOctetIP -p $port >/dev/null -oG RockStarportscan

cat RockStarportscan | grep open > RockStarportscanopen

cat RockStarportscanopen
