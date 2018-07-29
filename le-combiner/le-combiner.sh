#!/usr/bin/env bash

# Combine function
combine() {
    # move to the correct let's encrypt directory
    cd /etc/letsencrypt/live/$SITE

    # cat files to make combined .pem for haproxy
    cat fullchain.pem > /certs/$SITE.pem
    echo "" >> /certs/$SITE.pem
    cat privkey.pem >> /certs/$SITE.pem
}


for filename in /etc/letsencrypt/renewal/*.conf; do
	filename=$(basename $filename)
	domain=${filename%.conf}

	echo "Combining $domain"
	SITE=$domain combine
done
