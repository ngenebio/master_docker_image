FROM ubuntu:14.04
MAINTAINER cb.hong <cb.hong@ngenebio.com>

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
    sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
    gpg -a --export E084DAB9 | apt-key add - && \
    apt-get update -y && \
    apt-get clean;

RUN apt-get install libz-dev -y                             && \
    apt-get install libfftw3-dev -y                         && \
    apt-get install libdbi-perl -y                          && \
    apt-get install python-software-properties -y           && \
    apt-get install python2.7 -y                            && \
    apt-get install python-dev -y                           && \
    apt-get install python-setuptools -y                    && \
    apt-get install r-base=3.4.4-1trusty0 -y --force-yes    && \
    apt-get install libcurl3-nss -y                         && \
    apt-get clean;

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("PSCBS")'

RUN easy_install pip
RUN pip --no-cache-dir install futures==3.3.0
RUN pip --no-cache-dir install future==0.17.1
RUN pip --no-cache-dir install scipy==1.2.2
RUN pip --no-cache-dir install reportlab==3.5.32
RUN pip --no-cache-dir install biopython==1.69
RUN pip --no-cache-dir install matplotlib==2.2.2
RUN pip --no-cache-dir install pandas==0.20.0
RUN pip --no-cache-dir install pysam==0.14.1
RUN pip --no-cache-dir install PyVCF==0.6.8
RUN pip --no-cache-dir install pyfaidx==0.5.5.2

# RUN pip --no-cache-dir install pysam==0.9.1.4