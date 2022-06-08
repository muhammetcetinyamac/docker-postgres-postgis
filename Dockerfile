FROM postgres:9.6

# Allow connections
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

# Customize default user/pass/db
ENV POSTGRES_DB postgres
ENV POSTGRES_USER postgres
ARG POSTGRES_PASSWORD postgres

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-9.6-postgis-2.4 \
    postgresql-9.6-postgis-2.4-scripts \
    build-essential \
    ca-certificates \
    cmake \
    git \
    pgxnclient \
    postgresql-server-dev-9.6 \
    sudo

# Install h3 1.0.2
RUN pgxn install h3=1.0.2

# Include postgis and h3 setup scripts
ADD ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

CMD ["/usr/local/bin/docker-entrypoint.sh","postgres"]