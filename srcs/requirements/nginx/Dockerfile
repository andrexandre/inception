FROM nginx

# EXPOSE 443

COPY tools/index.html /usr/share/nginx/html
COPY conf/nginx.conf /etc/nginx/nginx.conf
# COPY conf/nginx.conf /etc/nginx/conf.d

RUN chown -R nginx:nginx /usr/share/nginx/html/index.html
