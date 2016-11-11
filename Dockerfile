FROM daocloud.io/leeonky/ruby-installer:master-55f9c33

USER root

RUN install-ruby 2.3.1
RUN gem install rails -v 4.2.5

USER $USER_NAME
CMD bash

