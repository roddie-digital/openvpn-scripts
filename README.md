# OpenVPN scripts

## `crlgen.sh` (CRL generator)

In OpenVPN, CRLs are generated when new keys/tokens are created. If you don't generate any new tokens, when the CRL expires you won't be able to connect. Either manually run this script to generate a new CRL or add a cron job to do it on a schedule.
