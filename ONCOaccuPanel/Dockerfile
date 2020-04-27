FROM ubuntu:16.04
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

RUN useradd -m -s /bin/bash -u 1001 ngenebio    && \
    usermod -aG ngenebio ngenebio               && \
    chown -R ngenebio:ngenebio /NGENEBIO

RUN apt-get update -y                                                                               && \
    apt-get dist-upgrade -y                                                                         && \
    apt-get install software-properties-common -y                                                   && \
    sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list'    && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9        && \
    gpg -a --export E084DAB9 | apt-key add -                                                        && \
    add-apt-repository ppa:openjdk-r/ppa -y                                                           

RUN	apt-get update -y                                       && \
    apt-get install language-pack-en -y                     && \
    apt-get install libz-dev -y                             && \
    apt-get install libfftw3-dev -y                         && \
    apt-get install libdbi-perl -y                          && \
    apt-get install libcgi-session-perl -y                  && \
    apt-get install libssl-dev -y                           && \
    apt-get install libffi-dev -y                           && \
    apt-get install python-software-properties -y           && \
    apt-get install python2.7 -y                            && \
    apt-get install python-dev -y                           && \
    apt-get install python-setuptools -y                    && \
    apt-get install python-pip -y                           && \
    apt-get install python3-pip -y                          && \
    apt-get install r-base=3.4.4-1xenial0 -y --force-yes    && \
    apt-get install libcurl3-nss -y                         && \
    apt-get install bc -y                                   && \
    apt-get install libcurl4-openssl-dev -y                 && \
    apt-get install openjdk-8-jdk -y                        && \
    apt-get clean;

RUN Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("PSCBS")'
RUN R -e "install.packages('diagram',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('extrafont',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install setuptools
RUN pip --no-cache-dir install requests[security]
RUN pip --no-cache-dir install futures==3.3.0
RUN pip --no-cache-dir install future==0.17.1
RUN pip --no-cache-dir install scipy==1.2.2
RUN pip --no-cache-dir install reportlab==3.5.32
RUN pip --no-cache-dir install biopython==1.69
RUN pip --no-cache-dir install matplotlib==2.2.2
RUN pip --no-cache-dir install pandas==0.20.0
RUN pip --no-cache-dir install PyVCF==0.6.8
RUN pip --no-cache-dir install pyfaidx==0.5.5.2
RUN pip --no-cache-dir install urllib3==1.22
RUN pip --no-cache-dir install hgvs==1.2.4
RUN pip --no-cache-dir install pysam==0.9.0
RUN pip3 install pysam==0.14.1

RUN pip --no-cache-dir install pysam==0.7.6
# RUN pip --no-cache-dir install pysam==0.8.0
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get update
RUN apt-get install python3.6 -y
RUN apt-get install curl
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN pip3.6 install pysam==0.14.1
RUN pip3.6 install hgvs==1.5.0
RUN pip3.6 install PyVCF==0.6.8

ENV UTA_DB_URL postgresql://uta_admin:uta_admin@localhost/uta/uta_20180821
ENV HGVS_SEQREPO_DIR /NGENEBIO/workflow-dependencies/HGVS/seq_repo/latest