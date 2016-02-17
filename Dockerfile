FROM xsteadfastx/alpine-x86:edge

RUN apk add --update \
    alpine-sdk \
    git-email \
    pax-utils \
    vim \
 && rm -rf /var/cache/apk/* \
 && echo "/home/marv/packages/testing" >> /etc/apk/repositories

RUN adduser -D -s /bin/sh marv

RUN echo "marv ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN addgroup marv abuild \
 && chgrp abuild /var/cache/distfiles \
 && chmod g+w /var/cache/distfiles

USER marv
WORKDIR /home/marv

RUN git config --global user.name "Marvin Steadfast" \
 && git config --global user.email "marvin@xsteadfastx.org" \
 && git config --global sendemail.smtpserver smtp.gmail.com \
 && git config --global sendemail.smtpserverport 587 \
 && git config --global sendemail.smtpencryption tls \
 && git config --global sendemail.smtpuser xsteadfastx@gmail.com \
 && git config --global sendemail.to alpine-aports@lists.alpinelinux.org \
 && git config --global color.ui false

#RUN git clone git://dev.alpinelinux.org/aports

#RUN abuild-keygen -a -i

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
