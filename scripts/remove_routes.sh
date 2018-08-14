#!/bin/bash
echo "remove routes"
while read p; do
  echo route del -net $p gw 10.8.0.1 tun0
  sudo route del -net $p gw 10.8.0.1 tun0
done <iplist.txt