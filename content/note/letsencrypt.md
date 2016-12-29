+++
title = "letsencrypt"
tags = ["letsencrypt"]
description = "how easy is to set up letsencrypt!"
date = "2016-12-28T23:39:12+01:00"
draft = false

+++

I'm trying to obtain Letsencrypt certificate for a first time. They have detailed [instruction for debian 8 + nginx](https://certbot.eff.org/#debianjessie-nginx)

What is missing in instruction:

### you have to enable `backports` repository (check [debian instruction](https://backports.debian.org/Instructions/)).
In case of debian 8 it is like that:

    echo deb http://ftp.debian.org/debian jessie-backports main > /etc/apt/sources.list
    apt-get update

Then follow the instruction an after a few clicks and you'll got certificates in `/etc/letsencrypt/live/<domain name>/fullchain.pem`.

**Perfect!**

Ceritifactes have a short lifetime of 90 days, so some automation needed. And it's allready there, in certbot! During
domain validation I haven't choosen web based verification and prefer to throw up a temporary server instead. I'll stay
with my decision. So I've created a script called `certrenew` and placed it into `/usr/sbin` 
(don't forget to `chmod +x`):

    #!/bin/sh
    set -e
    /bin/systemctl stop nginx
    /usr/bin/certbot renew -q
    /bin/systemctl start nginx

And I think also that everyone will update their certificates on 00:00 of 1th of the month, so I'll
be not like everyone and update mine at 04:00 on 3th of the month insted. For autorenew of certificates I've added this
line into crontab:

    0 4 2 * * /ust/sbin/certrenew

That's all folks

