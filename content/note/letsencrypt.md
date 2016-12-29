+++
title = "letsencrypt"
tags = ["letsencrypt"]
description = "how easy is to set up letsencrypt"
date = "2016-12-28T23:39:12+01:00"
draft = false

+++

I'm trying to obtain Letsencrypt certificate for a first time. They have detailed [instruction for debian 8 + nginx](https://certbot.eff.org/#debianjessie-nginx)

What is missing in instruction:

### you need to have `backports` enabled ([debian instruction](https://backports.debian.org/Instructions/)). In case of Debian 8 it is simply

    echo deb http://ftp.debian.org/debian jessie-backports main > /etc/apt/sources.list
    apt-get update

Then just a few clicks and I got certificate in `/etc/letsencrypt/live/<domain name>/fullchain.pem`. Perfekt!

for autorenew of certificates I've added a line into cron 

    0 3 1 * * /usr/bin/certbot renew -q && systemctl restart nginx





    
