FROM ubuntu:20.10

LABEL maintainer="Miroslaw Ochodek <miroslaw.ochodek@gmail.com>"
LABEL description="This is a Docker image for the course QMESE@PUT."

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yqq update \
    && apt-get -yqq update \
    && apt-get -yqq upgrade \
    && apt-get install -yqq \
        git \
        wget \
        libssl-dev \
    && rm -rf /var/lib/apt/lists/*
RUN ln -s /bin/tar /bin/gtar

WORKDIR /root/

# Install Miniconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' >> /root/.bashrc \
    && wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh \
    && /bin/bash ~/miniconda.sh -b -p /opt/conda \
    && rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

# Python + Jupyter
COPY python-qmese.yml .
RUN conda install pip jupyter \
    && conda env create -v -f ./python-qmese.yml \
    && conda init bash \
    && rm ./python-qmese.yml

RUN activate python-qmese \
    && python -m ipykernel install --user --name python-qmese --display-name "Python QMESE" 

# Some prerequisities for R
RUN apt-get update \
    && apt-get install -yqq --no-install-recommends \
        fonts-dejavu \
        gfortran \
        gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# R
RUN apt-get update \
    && apt-get install -yqq r-base \
    && rm -rf /var/lib/apt/lists/* \
    && conda install -c r r-irkernel r-essentials -c conda-forge 
COPY install.r .
RUN Rscript ./install.r

VOLUME [ "/root/notebooks" ]

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''","--NotebookApp.password=''"]



