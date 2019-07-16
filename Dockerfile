FROM ubuntu:14.04
MAINTAINER cb.hong <cb.hong@ngenebio.com>

RUN echo 'export LC_MESSAGES="en_US.UTF-8"' >> /etc/profile
RUN echo 'export LANG="en_US.UTF-8"' >> /etc/profile
RUN echo 'export LANGUAGE="en_US:en"' >> /etc/profile
RUN echo 'export LC_ALL="en_US.UTF-8"' >> /etc/profile
RUN echo 'export HGVS_SEQREPO_DIR=/NGENEBIO/workflow-dependencies/HGVS/seq_repo/latest' >> /etc/profile
RUN echo 'export UTA_DB_URL=postgresql://uta_admin:uta_admin@localhost/uta/uta_20180821' >> /etc/profile

RUN mkdir /NGENEBIO
RUN mkdir /NGENEBIO/workflow
RUN mkdir /NGENEBIO/workflow-app
RUN mkdir /NGENEBIO/workflow-dependencies
RUN mkdir /NGENEBIO/workflow_out

RUN apt-get update -y  && \
    apt-get dist-upgrade -y && \
    sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
    gpg -a --export E084DAB9 | apt-key add - && \
    apt-get update -y && \
    apt-get clean;

RUN apt-get install bc -y && \
    apt-get install curl libcurl3 -y && \
    apt-get install db-util -y && \
    apt-get install imagemagick -y && \
    apt-get install libconfig-yaml-perl -y && \
    apt-get install libcurl3-nss -y && \
    apt-get install libcurl4-openssl-dev -y && \
    apt-get install libcurl4-openssl-dev libxml2-dev -y && \
    apt-get install libfreetype6-dev -y && \
    apt-get install libgtextutils-dev -y && \
    apt-get install libpq-dev -y && \
    apt-get install libtbb2 -y && \
    apt-get install libxml2-dev -y && \
    apt-get install openssh-client -y && \
    apt-get install perl -y && \
    apt-get install realpath -y && \
    apt-get install software-properties-common -y && \
    apt-get install tabix=0.2.6-2 -y && \
    apt-get install vim -y && \
    apt-get install python-software-properties -y && \
    apt-get install python2.7 -y  && \
    apt-get install python-dev -y  && \
    apt-get install python-setuptools -y  && \
    apt-get install r-base=3.4.4-1trusty0 -y && \
    apt-get install r-cran-rmysql=0.9-3-2 -y && \
    apt-get clean;

RUN easy_install pip
RUN pip --no-cache-dir install biopython==1.69
RUN pip --no-cache-dir install boto==2.48.0
RUN pip --no-cache-dir install coverage==4.5.1
RUN pip --no-cache-dir install cutadapt==1.16
RUN pip --no-cache-dir install fadapa==0.3.1
RUN pip --no-cache-dir install hgvs==1.1.2
RUN pip --no-cache-dir install htseq==0.9.1
RUN pip --no-cache-dir install image==1.5.20
RUN pip --no-cache-dir install matplotlib==2.2.2
RUN pip --no-cache-dir install numpy==1.14.2
RUN pip --no-cache-dir install pandas==0.22.0
RUN pip --no-cache-dir install pysam==0.14.1
RUN pip --no-cache-dir install PyVCF==0.6.8
RUN pip --no-cache-dir install qrcode==6.0
RUN pip --no-cache-dir install seaborn==0.8.1
RUN pip --no-cache-dir install pytabix==0.1

WORKDIR /NGENEBIO

COPY ./bash_r.sh ./

RUN ["./bash_r.sh"]
