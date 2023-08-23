FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/script ./script

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/    
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x script

RUN ./script

CMD ["mariadbd", "--skip_networking=false"]#read this 