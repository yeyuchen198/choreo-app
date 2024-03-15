# FROM nginx:1.19.3-alpine
# FROM yuchen168/uwsgi-nginx-unprivileged
FROM yuchen168/uwsgi-nginx-unprivileged-python

USER 10014
RUN adduser -u 10014 -d /home/user user
RUN chown -R user:user /home/user

COPY nginx.conf /etc/nginx/nginx.conf
COPY app.json /etc/uwsgi/app.json

# COPY MajesticAdmin-Free-Bootstrap-Admin-Template-master.zip /usr/local/html.zip
# WORKDIR /usr/local
# RUN mkdir html
# RUN unzip html.zip -o -d html

# COPY uwsgi /tmp/uwsgi
# RUN install -m 755 /tmp/uwsgi /usr/bin/uwsgi
# RUN rm /tmp/uwsgi
# RUN /usr/bin/uwsgi -config=/etc/uwsgi/app.json


# ENV PORT=7860
EXPOSE 7860

# CMD ["nginx", "-g", "daemon off;"]
# nginx -g 'daemon off;'

ADD app.sh /
RUN chmod +x /app.sh
CMD /app.sh
