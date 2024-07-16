FROM nginx

COPY ./tools/index.html /usr/share/nginx/html
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R nginx:nginx /usr/share/nginx/html/index.html
