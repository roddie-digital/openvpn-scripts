#!/bin/sh
# 2021-07-23 https://roddie.digital
# Check and regenerate OpenVPN CRL
# Run as root

# check location of crl
grep "crl-verify" /etc/openvpn/server.conf

read -p "Press Enter to continue ..."

# check date of current crl
echo "Checking /etc/openvpn/crl.pem ..."
echo ""
openssl crl -in /etc/openvpn/crl.pem -text | grep Next

read -p "Press Enter to continue ..."

# generate the new crl
/etc/openvpn/easy-rsa/easyrsa gen-crl

# copy it to the right location
cp -v /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn/crl.pem

# restart openvpn
systemctl restart openvpn

# check openvpn
systemctl status openvpn

# check the new expiry date
echo "New expiry date:"
echo ""
grep "crl-verify" /etc/openvpn/server.conf
