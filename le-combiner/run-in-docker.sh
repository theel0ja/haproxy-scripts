HAPROXY_FOLDER=$PWD

# TODO: Migrate from Ubuntu image to some smaller one.
docker run -it --rm --name le-combiner \
    -v "letsencrypt-etc:/etc/letsencrypt" \
    -v "haproxy-certs:/certs" \
    -v "${HAPROXY_FOLDER}/scripts/le-combiner:/scripts/le-combiner" \
    ubuntu:16.04 /bin/bash "/scripts/le-combiner/le-combiner.sh"
