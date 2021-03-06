FROM techempower/php7:0.1

ADD ./ /slim
WORKDIR /slim

RUN composer.phar install --no-progress

RUN chmod -R 777 /slim

CMD service php7.2-fpm start && \
    nginx -c /slim/deploy/nginx-fpm-7.conf -g "daemon off;"
