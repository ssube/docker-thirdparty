FROM docker.artifacts.apextoaster.com/apextoaster/docker:20.10-master

ENV DIND_COMMIT 42b1175eda071c0e9121e1d64345928384a93df1
RUN set -eux; \
	wget -O /usr/local/bin/dind "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind"; \
	chmod +x /usr/local/bin/dind

ENV ENTRY_COMMIT 8baa881aab85f8398d2edbbcc0da4bd1f556dd98
RUN set -eux; \
  wget -O /usr/local/bin/dockerd-entrypoint.sh "https://raw.githubusercontent.com/docker-library/docker/${ENTRY_COMMIT}/20.10/dind/dockerd-entrypoint.sh"; \
  chmod +x /usr/local/bin/dockerd-entrypoint.sh

VOLUME /var/lib/docker
EXPOSE 2375 2376

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
