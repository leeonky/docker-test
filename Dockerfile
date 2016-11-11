FROM daocloud.io/leeonky/ruby-installer:master-2d295e0

USER $USER_NAME

RUN install-ruby 2.3.1
RUN gem install rails -v 4.2.5

ADD development_loop /usr/local/bin/
RUN sudo chmod +x /usr/local/bin/development_loop

