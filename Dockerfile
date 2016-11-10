FROM daocloud.io/leeonky/centos-7:master-83d8552

###### tools for install ruby-install and build ruby
RUN sudo yum install -y \
	bzip2 \
	gcc \
	make

WORKDIR $USER_HOME
RUN curl -o ruby-install-0.6.0.tar.gz -L https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
RUN tar -zxf ruby-install-0.6.0.tar.gz && \
	cd ruby-install-0.6.0/ && \
	sudo make install

#ADD install-ruby $USER_HOME/bin/
#RUN chown $USER:$USER $USER_HOME/bin/install-ruby && \
#	chmod +x $USER_HOME/bin/install-ruby

