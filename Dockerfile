FROM daocloud.io/leeonky/centos-7

USER root

###### install basic tools
RUN yum -y install \
	net-tools.x86_64 \
	openssh-clients.x86_64 \
	bash-completion \
	wget \
	unzip.x86_64

###### install basic development tools
RUN yum -y groupinstall 'Development Tools'
