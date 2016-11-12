FROM daocloud.io/leeonky/rails-2.3.1-4.2.5:1.1.0	

USER root

ADD bundle_install /usr/local/bin/
RUN chmod +x /usr/local/bin/bundle_install

ADD gemfile /tmp/

USER $USER_NAME
RUN bundle_install /tmp/gemfile

CMD bash

