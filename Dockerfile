FROM daocloud.io/leeonky/ruby-installer:master-633f80e

ADD install-ruby /usr/local/bin
RUN chmod +x /usr/local/bin/install-ruby

RUN install-ruby 2.3.1

