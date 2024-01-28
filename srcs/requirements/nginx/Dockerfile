FROM debian:bullseye
RUN apt update -y && apt upgrade -y && apt install nginx -y
RUN apt install openssl -y
COPY tools/certificate.crt /etc/ssl/
COPY tools/private.key /etc/ssl/
COPY conf/default.conf /etc/nginx/conf.d/
RUN chmod 777 /etc/nginx/conf.d/default.conf
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]