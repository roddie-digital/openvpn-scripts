# OpenVPN scripts

## `crlgen.sh` (CRL generator)

In OpenVPN, CRLs are generated when new keys/tokens are created. If you don't generate any new tokens within six months, the CRL will expire and you won't be able to connect. Either manually run this script to generate a new CRL or remove the `read` commands and use it as a cron job to do it on a schedule.
