# Version 0.0.1
FROM ubuntu:latest
MAINTAINER Jemima Li "jemimalwh@gmail.com"
ENV WORK_SPACE /workspace
RUN \
	apt-get -yqq update \
	&& apt-get -y install build-essential checkinstall \
	&& apt-get -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
	&& mkdir download && cd download \
	&& apt-get -y install wget && apt-get -y install git \
	&& apt-get -y install fortran77-compiler && apt-get -y install gfortran && apt-get -y install r-base \
	&& apt-get -y install default-jre && apt-get -y install default-jdk \
	&& wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz && tar -xvf Python-2.7.12.tgz && cd Python-2.7.12 && ./configure && make && checkinstall -y && cd .. \
	&& apt-get -f -y install && apt-get -y install curl  && apt-get clean all && rm -rf /var/lib/apt/lists/* \
	&& curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python get-pip.py \
	&& pip install numpy && pip install biopython && pip install mercurial \
	&& hg clone https://jemimalwh@bitbucket.org/sebastian_boegel/seq2hla \
	&& git clone --recursive https://github.com/jts/bam2fastq && cd bam2fastq && make && cd .. \
	&& git clone --recursive https://github.com/BenLangmead/bowtie && cd bowtie && make	&& cd .. \
	&& wget https://cloud.r-project.org/src/base/R-3/R-3.2.1.tar.gz && tar -zxvf R-3.2.1.tar.gz && cd R-3.2.1 && ./configure && make && make install && cd .. \
	&& ln -s /download/bowtie/bowtie /usr/local/bin/bowtie \
	&& ln -s /download/bam2fastq /usr/local/bin/bam2fastq \
	&& wget https://sourceforge.net/projects/bbmap/files/latest/download/BMap_36.14.tar.gz && tar -xzxf BMap_36.14.tar.gz \
       	&& rm /download/*gz \
	&& mkdir $WORK_SPACE && cd $WORK_SPACE

## Work Directory
WORKDIR /workspace
