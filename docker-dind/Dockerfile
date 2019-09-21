FROM apextoaster/docker:18.09-master

# dind hacks
ARG DIND_COMMIT=master
ENV DOCKER_EXTRA_OPTS '--storage-driver=overlay2'
RUN curl -fL -o /usr/local/bin/dind "https://raw.githubusercontent.com/moby/moby/${DIND_COMMIT}/hack/dind" \
 && chmod +x /usr/local/bin/dind

# entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

VOLUME /var/lib/docker
EXPOSE 2375
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
