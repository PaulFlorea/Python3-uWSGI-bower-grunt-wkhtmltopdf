FROM paulflorea/python3-uwsgi-bower-grunt:alpine


# Download and install wkhtmltopdf
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; apk upgrade --update-cache --available
RUN apk add --update postgresql-dev wkhtmltopdf coreutils xvfb dbus


# Install xvfb to use wkhtmltopdf without X server
ADD ./packages/wkhtmltopdf /usr/local/bin/
ADD ./packages/xvfb-run /usr/bin/

RUN chmod a+x /usr/local/bin/wkhtmltopdf
RUN chmod +x /usr/bin/xvfb-run