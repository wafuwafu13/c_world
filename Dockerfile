From centos:7

WORKDIR /root

RUN yum -y update && \
    yum -y groupinstall "Development Tools" && \
    yum install -y wget

# Update autoconf
RUN wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz && \
    tar xvf autoconf-2.69.tar.gz 

WORKDIR /root/autoconf-2.69
RUN ./configure --prefix=/usr && \
    make && \
    make install

# Update automake
WORKDIR /root
RUN wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz && \
    tar xvf automake-1.14.tar.gz

WORKDIR /root/automake-1.14
RUN ./configure --prefix=/usr && \
    make && \
    make install

# Update bison
WORKDIR /root
RUN wget http://ftp.gnu.org/gnu/bison/bison-2.5.1.tar.gz && \
    tar xvf bison-2.5.1.tar.gz
WORKDIR /root/bison-2.5.1
RUN ./configure --prefix=/usr && \
    make && \
    make install

# Install glib
WORKDIR /root
RUN yum -y install glib2-devel


# C++
WORKDIR /root
RUN yum -y install libevent-devel zlib-devel openssl-devel

# Install pip
WORKDIR /root
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
python get-pip.py && \
python -m pip -V

# Install six
RUN pip install six

ENV LD_LIBRARY_PATH=/usr/local/lib

# Install 'which'
RUN yum install -y which

# Install OpenJDK
RUN yum install -y java-1.8.0-openjdk-devel
