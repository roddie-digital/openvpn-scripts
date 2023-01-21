#!/bin/bash
# 2021-07-23 https://roddie.digital
# Check and regenerate OpenVPN CRL
# Run as root

# check location of crl
echo "Checking location of CRL:"
grep "crl-verify" /etc/openvpn/server.conf

read -p "Press Enter to continue ..."

# check date of current crl
echo "Checking /etc/openvpn/crl.pem ..."
echo ""
openssl crl -in /etc/openvpn/crl.pem -text | grep Next

read -p "Press Enter to continue ..."

# generate the new crl
echo "Generating new CRL..."
/etc/openvpn/easy-rsa/easyrsa gen-crl

# copy it to the right location
cp -v /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn/crl.pem

# restart openvpn
systemctl restart openvpn

# check openvpn
systemctl status openvpn

# check the new expiry date
echo ""
openssl crl -in /etc/openvpn/crl.pem -text | grep Next
