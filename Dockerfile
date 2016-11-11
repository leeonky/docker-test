FROM daocloud.io/leeonky/test:master-32fbbf7

RUN yum install -y which
RUN yum install -y git
RUN yum install -y gcc-c++
RUN yum install -y postgresql-devel
RUN yum install -y sqlite-devel.x86_64
RUN yum install -y ImageMagick-devel
RUN yum install -y qtwebkit-devel

USER $USER_NAME
CMD bash

