FROM daocloud.io/leeonky/ruby-installer:master-6af48db

###### tools for install ruby-install
RUN sudo yum install -y \
	bzip2

############

WORKDIR $USER_HOME
RUN curl -o ruby-install-0.6.0.tar.gz -L https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
RUN tar -zxf ruby-install-0.6.0.tar.gz && \
	cd ruby-install-0.6.0/ && \
	sudo make install

RUN ruby-install ruby 2.3.1

#ADD tglgemsrc $DEV_HOME/bin/
#RUN sudo chmod +x $DEV_HOME/bin/tglgemsrc

