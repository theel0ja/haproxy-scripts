HAPROXY_FOLDER=$PWD

docker run -it --rm --name certbot-renew \
    -v "letsencrypt-etc:/etc/letsencrypt" \
    -v "letsencrypt-var-lib:/var/lib/letsencrypt" \
    -v "${HAPROXY_FOLDER}/secrets:/app/haproxy/secrets" \
    -v "haproxy-certs:/certs" \
    -v "${HAPROXY_FOLDER}/scripts/le-combiner:/scripts/le-combiner" \
    certbot/dns-cloudflare renew --renew-hook "/scripts/le-combiner/le-combiner.sh"
