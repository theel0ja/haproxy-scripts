#!/usr/bin/env bash

# https://askubuntu.com/a/15856
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi


FOLDER=/etc/haproxy/certs

# Combine function
combine() {
    # move to the correct let's encrypt directory
    cd /etc/letsencrypt/live/$SITE

    COMBINED_FILE=$FOLDER/$SITE.pem

    # cat files to make combined .pem for haproxy
    cat fullchain.pem > $COMBINED_FILE
    echo "" >> $COMBINED_FILE
    cat privkey.pem >> $COMBINED_FILE

    chmod 600 $COMBINED_FILE
}


for filename in /etc/letsencrypt/renewal/*.conf; do
	filename=$(basename $filename)
	domain=${filename%.conf}

	echo "Combining $domain"
	SITE=$domain combine
done
