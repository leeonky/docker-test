###################centos-7##########################

FROM daocloud.io/centos:7.2.1511

###### EPEL repository
RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

###### install basic tools
RUN yum install -y sudo \
	mount.nfs

###### add user gauss
ENV USER_NAME gauss
ENV USER_HOME /home/$USER_NAME
RUN ( printf 'root\nroot\n' | passwd ) && \
	useradd $USER_NAME -m && \
	( echo 'gauss    ALL=(ALL)       NOPASSWD:ALL' > /etc/sudoers.d/$USER_NAME ) && \
	sed 's/^Defaults \{1,\}requiretty'//g -i /etc/sudoers

ADD lang.sh /etc/profile.d/
USER $USER_NAME

###### enable .bashrc.d
RUN echo 'for f in $(ls ~/.bashrc.d/); do source ~/.bashrc.d/$f; done' >> $USER_HOME/.bashrc && \
	mkdir -p $USER_HOME/.bashrc.d

##################ruby installer####################

USER root

###### install tools for build ruby-install and ruby
RUN yum install -y \
	bzip2 \
	gcc \
	make

######  install ruby-install
RUN curl -o ruby-install-0.6.0.tar.gz -L https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
RUN tar -zxf ruby-install-0.6.0.tar.gz && \
	cd ruby-install-0.6.0/ && \
	sudo make install

ADD install-ruby /usr/local/bin/
RUN chmod +x /usr/local/bin/install-ruby

RUN install-ruby 2.3.1
RUN gem install rails -v 4.2.5

ADD development_loop /usr/local/bin/
RUN sudo chmod +x /usr/local/bin/development_loop

USER $USER_NAME

######################ruby ###########################
USER root
RUN install-ruby 2.3.1

USER $USER_NAME

######################rails ###########################
USER root
RUN gem install rails -v 4.2.5


#######################################

RUN yum install -y which
RUN yum install -y git
RUN yum install -y gcc-c++
RUN yum install -y postgresql-devel
RUN yum install -y sqlite-devel.x86_64
RUN yum install -y ImageMagick-devel
RUN yum install -y qtwebkit-devel

USER $USER_NAME
CMD bash

