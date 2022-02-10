FROM ubuntu:20.04
MAINTAINER wavvs

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y haproxy tor netcat ruby wget curl zlib1g-dev libyaml-dev
RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/p/polipo/polipo_1.1.1-8_amd64.deb
RUN dpkg -i polipo_1.1.1-8_amd64.deb

RUN update-rc.d -f tor remove
RUN update-rc.d -f polipo remove

RUN gem install excon

ADD start.rb /usr/local/bin/start.rb
RUN chmod +x /usr/local/bin/start.rb

ADD newnym.sh /usr/local/bin/newnym.sh
RUN chmod +x /usr/local/bin/newnym.sh

ADD haproxy.cfg.erb /usr/local/etc/haproxy.cfg.erb
ADD uncachable /etc/polipo/uncachable

EXPOSE 5566 4444

CMD /usr/local/bin/start.rb
