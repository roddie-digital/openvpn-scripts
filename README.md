# OpenVPN scripts

## `crlgen.sh` (CRL generator)

In [OpenVPN](https://openvpn.net), a new certificate revocation list (CRL) is only generated when new keys/tokens are created. If you don't generate any new tokens within six months, the CRL will expire and your clients won't be able to connect to your VPN server. Either manually run this script to generate a new CRL or remove the `read` commands and use it as a cron job to do it on a schedule. (This script is based on a Debian install so paths may differ depending on what distro you're using or how you installed OpenVPN.)
