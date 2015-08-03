FROM phusion/baseimage:latest

ENV HOME /root
RUN rm -f /etc/service/sshd/down
RUN /usr/sbin/enable_insecure_key
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

RUN apt-get update && apt-get -y install git nano screen wget

RUN curl -sL https://deb.nodesource.com/setup_iojs_1.x | sudo bash -
RUN apt-get -y install iojs

RUN npm install -g ember-cli@1.13.1
RUN npm install -g bower
RUN npm install -g npm-check

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 4200
EXPOSE 35729

VOLUME /webroot
WORKDIR /webroot

CMD ["/sbin/my_init"]