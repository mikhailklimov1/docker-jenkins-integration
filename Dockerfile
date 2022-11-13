FROM httpd

RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo "password" | passwd remote_user --stdin

