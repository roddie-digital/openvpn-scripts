#!/bin/sh
# 2019-04-01 https://roddie.digital
# Check and regenerate OpenVPN CRL

# move into the right dir
cd /etc/openvpn/easy-rsa

# check location of crl
sudo cat /etc/openvpn/server.conf | grep "crl-verify"

read -p "Press Enter to continue ..."

# check date of current crl
echo "Checking /etc/openvpn/crl.pem ..."
echo ""
sudo openssl crl -in /etc/openvpn/crl.pem -text | grep Next

read -p "Press Enter to continue ..."

# generate the new crl
sudo ./easyrsa gen-crl

# copy it to the right location
sudo cp -v /etc/openvpn/easy-rsa/pki/crl.pem ../crl.pem

# restart openvpn
sudo systemctl restart openvpn

# check openvpn
systemctl status openvpn
