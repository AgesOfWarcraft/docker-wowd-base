FROM agesofwarcraft/wowd-base:run

RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN add-apt-repository ppa:kzemek/boost
RUN apt-get update
RUN apt-get install -y curl g++-6 libssl-dev libmysqlclient-dev libreadline6-dev zlib1g-dev libbz2-dev make git libncurses5-dev liblua5.2-dev
RUN apt-get install -y libboost1.58-dev libboost-filesystem1.58-dev libboost-iostreams1.58-dev libboost-program-options1.58-dev libboost-regex1.58-dev libboost-system1.58-dev libboost-thread1.58-dev

RUN curl -o /tmp/cmake.sh https://cmake.org/files/v3.12/cmake-3.12.0-Linux-x86_64.sh 
RUN chmod +x /tmp/cmake.sh
RUN /tmp/cmake.sh --skip-license --exclude-subdir --prefix=/usr/

ENV CXX=/usr/bin/g++-6
ENV CC=/usr/bin/gcc-6
