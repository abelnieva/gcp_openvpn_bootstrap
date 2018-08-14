#!/bin/bash
echo "Getting latest AWS's routes"
wget -N https://ip-ranges.amazonaws.com/ip-ranges.json -O ../tmp/ip-ranges.json
jq -r '.prefixes | .[].ip_prefix ' < ../tmp/ip-ranges.json > iplist.txt
echo "Getting latest GITHUB's routes"
wget -N https://api.github.com/meta -O ../tmp/meta
jq -r '.git[]' < ../tmp/meta  >> iplist.txt
echo "Adding routes"
while read p; do
  echo route add -net $p gw 10.8.0.1 tun0
  sudo route add -net $p gw 10.8.0.1 tun0
done <iplist.txt
echo "route table"
netstat -nr 
