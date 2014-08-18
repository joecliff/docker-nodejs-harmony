#FROM ubuntu:14.04
FROM joecliff/ubuntu
MAINTAINER Frank Wu wj320@qq.com

RUN apt-get -y update 

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

# essential modules
RUN \
  npm install -g grunt-cli

