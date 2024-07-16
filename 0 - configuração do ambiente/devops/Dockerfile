FROM mysql

ENV MYSQL_ROOT_PASSWORD root123

COPY ./scripts/initdb.sql /docker-entrypoint-initdb.d/

EXPOSE 3306