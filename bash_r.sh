#!/bin/bash

R --slave --vanilla --quiet --no-save  << EOF
    install.packages(c('ggplot2','diptest','mvtnorm','trimcluster','kernlab','fpc','sysfonts','showtext','extrafont','diagram','xtable'), repos='http://cran.us.r-project.org')
    source("http://bioconductor.org/biocLite.R")
    biocLite("GenomicAlignments")
    biocLite("Gviz")
EOF
