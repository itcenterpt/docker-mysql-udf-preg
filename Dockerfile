FROM mariadb:10.4

RUN apt-get update && apt-get install -y wget ca-certificates build-essential libmysqlclient-dev libpcre3-dev && \
      wget -O lib_mysqludf_preg-1.2-rc2.tar.gz https://github.com/mysqludf/lib_mysqludf_preg/archive/lib_mysqludf_preg-1.2-rc2.tar.gz && \
      tar xzf lib_mysqludf_preg-1.2-rc2.tar.gz && \
      cd lib_mysqludf_preg-lib_mysqludf_preg-1.2-rc2 && \
      ./configure && \
      make install && \
      apt-get remove -y wget ca-certificates build-essential libmysqlclient-dev libpcre3-dev && \
      cp installdb.sql /docker-entrypoint-initdb.d/ && \
      cd .. && rm -rf lib_mysqludf_preg-lib_mysqludf_preg-1.2-rc2 && \
      apt-get clean && apt-get purge

COPY initdb.d /docker-entrypoint-initdb.d

# NO_ENGINE_SUBSTITUTION allows non-nullable fields without default value
CMD ["mysqld", "--sql-mode=NO_ENGINE_SUBSTITUTION"]
