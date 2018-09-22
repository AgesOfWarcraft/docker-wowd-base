FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN add-apt-repository ppa:kzemek/boost
RUN apt-get update
RUN apt-get install -y curl g++-6 libssl1.0.0 libmysqlclient18 libreadline6 zlib1g libbz2-1.0  libncurses5 mysql-client liblua5.2
RUN apt-get install -y libboost1.58 libboost-filesystem1.58 libboost-iostreams1.58 libboost-program-options1.58 libboost-regex1.58 libboost-system1.58 libboost-thread1.58


