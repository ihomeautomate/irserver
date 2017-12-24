FROM phusion/baseimage
CMD ["/sbin/my_init"]

WORKDIR /tmp
ADD http://www.irtrans.de/download/Server/Linux/irserver.tar.gz ./
RUN tar -xf irserver.tar.gz \
  && rm irserver.tar.gz \
  && /tmp/install.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/local/irtrans
RUN mkdir -p /usr/local/irtrans/logs

VOLUME /usr/local/irtrans/remotes /usr/local/irtrans/logs
EXPOSE 21000 21000/udp 8081

ENTRYPOINT ["./irserver64"]
CMD ["--help"]
