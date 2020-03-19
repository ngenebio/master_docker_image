FROM ubuntu:16.04
#MAINTAINER cb.hong <cb.hong@ngenebio.com>

RUN echo 'export LC_MESSAGES="en_US.UTF-8"' >> /etc/profile         && \
    echo 'export LANG="en_US.UTF-8"' >> /etc/profile                && \
    echo 'export LANGUAGE="en_US:en"' >> /etc/profile               && \
    echo 'export LC_ALL="en_US.UTF-8"' >> /etc/profile              && \
    echo 'export PATH="$PATH:/usr/bin/htslib-1.9"' >> /etc/profile

RUN mkdir -p /NGENEBIO/workflow                 && \
    mkdir -p /NGENEBIO/workflow-app             && \
    mkdir -p /NGENEBIO/workflow-dependencies    && \
    mkdir -p /NGENEBIO/workflow_out             

RUN useradd -m -s /bin/bash -u 1500 ngenebio    && \
    usermod -aG ngenebio ngenebio               && \
    chown -R ngenebio:ngenebio /NGENEBIO

RUN apt-get update -y  && \
    apt-get dist-upgrade -y && \
    sh -c 'echo "deb http://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" >> /etc/apt/sources.list' && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9       && \
    apt-get update -y

RUN apt-get install libz-dev -y                                    && \
    apt-get install libfftw3-dev -y                                && \
    apt-get install libdbi-perl -y                                 && \
    apt-get install python-software-properties -y                  && \
    apt-get install python2.7 -y                                   && \
    apt-get install python-dev -y                                  && \
    apt-get install python-setuptools -y                           && \
	apt-get install r-recommended=3.6.2-1xenial -y --force-yes     && \
	apt-get install r-base-html=3.6.2-1xenial -y --force-yes       && \
    apt-get install r-base=3.6.2-1xenial -y --force-yes            && \
    apt-get install libcurl3-nss -y                                && \
	apt-get install libcurl4-openssl-dev -y  					   && \
	apt-get install cpanminus -y                                   && \
	apt-get install libdb5.3-dev                                   && \
	apt-get install language-pack-en -y                            && \
	apt-get install openjdk-8-jdk -y                               && \
	apt-get install bc -y                                          && \
    apt-get clean;

RUN Rscript -e 'install.packages("diagram")' -e 'install.packages("BiocManager")' -e 'BiocManager::install("Rhtslib")' -e 'BiocManager::install("GenomicAlignments")' -e 'install.packages("extrafont")'

RUN easy_install pip
RUN pip --no-cache-dir install et-xmlfile==1.0.1
RUN pip --no-cache-dir install jdcal==1.4
RUN pip --no-cache-dir install numpy==1.15.4
RUN pip --no-cache-dir install olefile==0.46
RUN pip --no-cache-dir install openpyxl==2.5.11
RUN pip --no-cache-dir install pyfaidx==0.5.5.2
RUN pip --no-cache-dir install Pillow==5.3.0
RUN pip --no-cache-dir install pysam==0.15.1
RUN pip --no-cache-dir install PyVCF==0.6.8
RUN pip --no-cache-dir install six==1.11.0

RUN cpanm -v URI::Escape            && \
    cpanm -v Set::IntervalTree      && \
    cpanm -v Carp::Assert           && \
    cpanm -v JSON::XS               && \
    cpanm -v PerlIO::gzip           && \
    cpanm -v DB_File