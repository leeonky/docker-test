FROM daocloud.io/leeonky/test:master-32fbbf7

USER root

RUN yum install -y which
RUN yum install -y git
RUN yum install -y gcc-c++
RUN yum install -y postgresql-devel
RUN yum install -y sqlite-devel.x86_64
RUN yum install -y ImageMagick-devel
RUN yum install -y qtwebkit-devel && \
	ln -s /usr/lib64/qt4/bin/qmake /usr/bin/qmake

RUN yum install -y glibc.i686
RUN rpm -ivh http://www.cabextract.org.uk/cabextract-1.6-1.i386.rpm
RUN rpm -ivh https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
RUN yum install -y firefox

RUN rm ruby-install-0.6.0* -rf


USER $USER_NAME
CMD bash

