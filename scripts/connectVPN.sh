#!/bin/bash
echo "Creating temporary directory"
mkdir -p ./tmp

echo "Connecting VPN $1"
if [ $2 -eq 0 ]
then
echo "Note: the current VPN wont be your default GW "
openvpn --script-security 2 --up scripts/add_routes.sh --down scripts/cleanup.sh --config vpn-config/$1.ovpn --route-noexec
else 
openvpn --script-security 2 --up scripts/add_routes.sh --down scripts/cleanup.sh --config vpn-config/$1.ovpn
fi
