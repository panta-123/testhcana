FROM  centos:centos7

#ARG APP_VERSION
#ARG REPO_NAME

RUN yum update -q -y

RUN yum -y install epel-release &&\
    yum -y install git && \
    yum -y groupinstall 'Development Tools'&& \
    yum -y install gcc-c++ && \
    yum -y install make && \
    yum install -y root && \
    localedef -i en_US -f UTF-8 en_US.UTF-8

ADD https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2-linux-x86_64.tar.gz .
RUN tar -xvf cmake-3.22.2-linux-x86_64.tar.gz
RUN mv cmake-3.22.2-linux-x86_64 /usr/local/cmake
RUN ls -l /usr/local/cmake/bin
ENV PATH="/usr/local/cmake/bin:$PATH"
ADD https://github.com/JeffersonLab/hcana/archive/refs/tags/hcana-0.98.tar.gz .
RUN tar -xvf hcana-0.98.tar.gz
WORKDIR "/hcana-hcana-0.98"
# TODO get the latest tag from halla analyzer repo
#ADD https://github.com/JeffersonLab/analyzer/archive/refs/tags/Release-176.tar.gz .
#RUN tar -xvf Release-176.tar.gz
RUN ls -l
RUN mv  analyzer-Release-176/* /hcana-hcana-0.98/podd/
RUN ls -l /hcana-hcana-0.98/podd/
SHELL ["/bin/bash", "-c"]
#RUN source setup.sh
#RUN mkdir build 
#WORKDIR /hcana-hcana-0.98/build
RUN cmake -DCMAKE_INSTALL_PREFIX=$HOME/local/hcana -B build  -S /hcana-hcana-0.98
RUN cmake --build build -j8
RUN cmake --install build
ENV PATH="~/local/hcana/bin:$PATH"
ENV LD_LIBRARY_PATH="~/local/hcana/lib64:$LD_LIBRARY_PATH"
ENV ANALYZER=/hcana-hcana-0.98/podd
ENV HCANALYZER=/hcana-hcana-0.98
WORKDIR /hcana-hcana-0.98
RUN mkdir myworkdir
WORKDIR /hcana-hcana-0.98/myworkdir

