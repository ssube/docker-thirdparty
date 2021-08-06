FROM docker.artifacts.apextoaster.com/apextoaster/docker:20.10-master

ENV DIND_COMMIT 37498f009d8bf25fbb6199e8ccd34bed84f2874b
RUN set -eux; \
	wget -O /usr/local/bin/dind "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind"; \
	chmod +x /usr/local/bin/dind

ENV ENTRY_COMMIT 92d278e671f32a9ee4a3c0668e46a41f4a3b74b0
RUN set -eux; \
  wget -O /usr/local/bin/dockerd-entrypoint.sh "https://raw.githubusercontent.com/docker-library/docker/${ENTRY_COMMIT}/18.09/dind/dockerd-entrypoint.sh"; \
  chmod +x /usr/local/bin/dockerd-entrypoint.sh

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
