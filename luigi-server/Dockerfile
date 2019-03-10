FROM apextoaster/python3:3.5

ENV LUIGI_VERSION=2.8.3

RUN pip install \
  luigi==${LUIGI_VERSION} \
  psycopg2 \
  sqlalchemy

EXPOSE 8082/TCP

ENV LUIGI_CONFIG_DIR /etc/luigi/
ENV LUIGI_CONFIG_PATH /etc/luigi/luigid.conf

ENTRYPOINT luigid