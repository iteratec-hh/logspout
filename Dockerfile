FROM gliderlabs/logspout:master

ENV DOCKERIZE_VERSION v0.3.0

# Get dockerize
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# Wait for target logstash
CMD dockerize -wait tcp $(echo $ROUTE_URIS | grep -Eo '(tcp|udp).*$')