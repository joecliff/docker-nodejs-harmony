FROM ubuntu:14.04
MAINTAINER Frank Wu wj320@qq.com

# install essential packages
RUN \
  apt-get -y update && \
  apt-get -y install python g++ make wget 

# install nodejs
RUN \
  cd /tmp && \
  wget https://github.com/joyent/node/archive/v0.11.13.tar.gz && \
  tar xvzf v0.11.13.tar.gz && \
  rm -f v0.11.13.tar.gz && \
  cd node-* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-* 

