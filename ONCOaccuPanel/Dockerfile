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

RUN apt-get update -y                                       && \
    apt-get dist-upgrade -y                                 && \
    apt-get install software-properties-common -y           && \
    add-apt-repository ppa:openjdk-r/ppa -y
    
RUN	apt-get update -y                                       && \
    apt-get install language-pack-en -y                     && \
    apt-get install libz-dev -y                             && \
    apt-get install libfftw3-dev -y                         && \
    apt-get install libdbi-perl -y                          && \
    apt-get install libcgi-session-perl -y                  && \
    apt-get install libssl-dev -y                           && \
    apt-get install libffi-dev -y                           && \
    apt-get install libcurl3-nss -y                         && \
    apt-get install bc -y                                   && \
    apt-get install libcurl4-openssl-dev -y                 && \
    apt-get install openjdk-8-jdk -y

# Install R
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list'    && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9        && \
    gpg -a --export E084DAB9 | apt-key add -                                                        && \
    apt-get update -y                                                                               && \
    apt-get install r-base=3.4.4-1xenial0 -y --force-yes                                            && \
    Rscript -e 'source("http://bioconductor.org/biocLite.R")' -e 'biocLite("PSCBS")'                && \
    R -e "install.packages('diagram',dependencies=TRUE, repos='http://cran.rstudio.com/')"          && \
    R -e "install.packages('extrafont',dependencies=TRUE, repos='http://cran.rstudio.com/')"

# Install Python
RUN add-apt-repository ppa:deadsnakes/ppa -y                && \
    apt-get update -y                                       && \
    apt-get install python-software-properties -y           && \
    apt-get install python2.7 -y                            && \
    apt-get install python-dev -y                           && \
    apt-get install python-setuptools -y                    && \
    apt-get install python-pip -y

RUN python -m pip --no-cache-dir install --upgrade pip          && \
    python -m pip --no-cache-dir install setuptools             && \
    python -m pip --no-cache-dir install requests[security]     && \
    python -m pip --no-cache-dir install virtualenv             && \
    python -m pip --no-cache-dir install numpy==1.16.5

# SNV-PIPELINE
RUN virtualenv snv-pipeline
RUN /bin/bash -c 'source /snv-pipeline/bin/activate             && \
    python -m pip --no-cache-dir install numpy==1.16.5          && \
    python -m pip --no-cache-dir install urllib3==1.22          && \
    python -m pip --no-cache-dir install biopython==1.68        && \
    python -m pip --no-cache-dir install PyVCF==0.6.8           && \
    python -m pip --no-cache-dir install pyfaidx==0.5.5.2       && \
    python -m pip --no-cache-dir install hgvs==1.2.4            && \
    deactivate'

# Annotation-PIPELINE
RUN virtualenv annotation-pipeline
RUN /bin/bash -c 'source /annotation-pipeline/bin/activate      && \
    python -m pip --no-cache-dir install numpy==1.16.5          && \
    python -m pip --no-cache-dir install urllib3==1.22          && \
    python -m pip --no-cache-dir install biopython==1.69        && \
    python -m pip --no-cache-dir install PyVCF==0.6.8           && \
    python -m pip --no-cache-dir install pyfaidx==0.5.5.2       && \
    python -m pip --no-cache-dir install hgvs==1.2.4            && \
    python -m pip --no-cache-dir install pysam==0.15.3          && \
    deactivate'

# CNV-PIPELINE
RUN virtualenv cnv-pipeline
RUN /bin/bash -c 'source /cnv-pipeline/bin/activate             && \
    python -m pip --no-cache-dir install numpy==1.16.5          && \
    python -m pip --no-cache-dir install urllib3==1.22          && \
    python -m pip --no-cache-dir install biopython==1.68        && \
    python -m pip --no-cache-dir install futures==3.3.0         && \
    python -m pip --no-cache-dir install future==0.18.2         && \
    python -m pip --no-cache-dir install matplotlib==2.2.4      && \
    python -m pip --no-cache-dir install pandas==0.22.0         && \
    python -m pip --no-cache-dir install pomegranate==0.12.0    && \
    python -m pip --no-cache-dir install pyfaidx==0.5.7         && \
    python -m pip --no-cache-dir install pysam==0.15.3          && \
    python -m pip --no-cache-dir install reportlab==3.5.32      && \
    python -m pip --no-cache-dir install scipy==1.2.1           && \
    deactivate'

# SV-PIPELINE
RUN virtualenv sv-pipeline
RUN /bin/bash -c 'source /sv-pipeline/bin/activate              && \
    python -m pip --no-cache-dir install numpy==1.16.5          && \
    python -m pip --no-cache-dir install biopython==1.68        && \
    python -m pip --no-cache-dir install pysam==0.7.6           && \
    deactivate'

# HTML-PIPELINE
RUN virtualenv html-pipeline
RUN /bin/bash -c 'source /html-pipeline/bin/activate              && \
    python -m pip --no-cache-dir install natsort                  && \
    python -m pip --no-cache-dir install numpy==1.16.5            && \
    python -m pip --no-cache-dir install pandas==0.22.0         && \
    deactivate'

ENV UTA_DB_URL postgresql://uta_admin:uta_admin@localhost/uta/uta_20180821
ENV HGVS_SEQREPO_DIR /NGENEBIO/workflow-dependencies/HGVS/seq_repo/latest

RUN apt-get clean

USER root

COPY docker_install.sh /docker_install.sh
RUN chmod +x /docker_install.sh
RUN /docker_install.sh

#RUN apt-get install cpanminus -y
RUN apt install libxml2-dev
RUN R CMD javareconf
RUN Rscript -e 'install.packages("stringr")' -e 'install.packages("ggplot2")' -e 'install.packages("rmarkdown")' -e 'install.packages("BiocManager")' -e 'BiocManager::install("GenomicAlignments")' -e 'install.packages("plotly")' -e 'install.packages("dplyr")' -e 'install.packages("MSIseq")' -e 'install.packages("jsonlite")' -e 'install.packages("UpSetR")' -e 'install.packages("rJava")' -e 'BiocManager::install("BSgenome")' -e 'BiocManager::install("BSgenome.Hsapiens.UCSC.hg19")' -e 'install.packages("deconstructSigs")'
RUN apt-get install wget
CMD ["wget","-qO-","https://get.haskellstack.org/","|","sh"]
CMD ["wget","https://hackage.haskell.org/package/pandoc-1.17.0.3/pandoc-1.17.0.3.tar.gz"]
CMD ["tar","-zxvf","pandoc-1.17.0.3.tar.gz"]
CMD ["cd","pandoc-1.17.0.3"]
CMD ["stack","setup"]
CMD ["stack","install"]
