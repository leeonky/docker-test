FROM daocloud.io/leeonky/ruby-2.3.1:1.0.0

USER $USER_NAME

RUN bash --login gem install rails -v 4.2.5

