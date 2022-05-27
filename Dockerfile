FROM nginx:1.19.3-alpine
ENV TZ=Asia/Shanghai
RUN apk add --no-cache --virtual .build-deps ca-certificates bash curl unzip php7
ADD building.zip /building/building.zip
ADD userv.zip /userv/userv.zip
ADD config/default.conf.template /etc/nginx/conf.d/default.conf.template
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
