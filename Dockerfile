FROM daocloud.io/leeonky/ruby-2.3.1:1.0.0

USER $USER_NAME

RUN /bin/bash --login -c 'gem install rails -v 4.2.5'

