from alpine:edge
run apk update && apk upgrade && \
 apk add --virtual build-dependencies && \
 apk add bash supervisor xvfb x11vnc ttf-dejavu openbox dbus gnome-icon-theme && \
 apk add novnc nicotine-plus --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
 mkdir -p /root/nicotine-downloads && \
 sed -i "s/scale', false/scale', true/" /usr/share/novnc/vnc_lite.html && \
 ln -s /root/nicotine-downloads /usr/share/novnc && \
 apk del build-dependencies && \
 rm -rf /var/cache/apk/*
add etc /etc
add usr /usr
entrypoint ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
