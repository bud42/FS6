#FROM conda/miniconda2-centos6
#
#RUN yum -y update && \
#    yum install -y -q bzip2 ca-certificates curl epel-release unzip gcc \
#    && yum clean packages \
#    && rm -rf /var/cache/yum/* /tmp/* /var/tmp/*
#
## Install dax
#RUN pip install https://github.com/VUIIS/dax/archive/v0.7.1.zip
#
## Install FreeSurfer v6.0.0
#RUN yum install -y -q bc libgomp libXmu libXt tcsh perl \
#    && yum clean packages \
#    && rm -rf /var/cache/yum/* /tmp/* /var/tmp/*
#RUN echo "Downloading FreeSurfer ..." \
#    && curl -sSL --retry 5 \
#    https://www.dropbox.com/s/96fejazytcoaiay/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0_MinimumForDocker.tgz \
#    | tar xz -C /opt
#ENV FREESURFER_HOME=/opt/freesurfer
#
## Install recon-stats
#COPY src /opt/src/
#WORKDIR /opt/src/recon-stats
#RUN python setup.py install
#
## Make sure other stuff is in path
#RUN chmod +x /opt/src/make_screenshots.sh
#ENV PATH=/opt/src:$PATH
#
## Get the spider code
#COPY spider.py /opt/spider.py
#ENTRYPOINT ["python", "/opt/spider.py"]

FROM ubuntu:trusty

RUN apt-get update -qq && apt-get install -yq --no-install-recommends  \
    apt-utils bzip2 ca-certificates curl unzip xorg wget xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && localedef --force --inputfile=en_US --charmap=UTF-8 C.UTF-8 \
    && chmod 777 /opt && chmod a+s /opt

# Install packages required by dax
RUN apt-get update && apt-get install -y \
    python-pip libfreetype6-dev pkg-config libxml2-dev libxslt1-dev \
    python-dev zlib1g-dev python-numpy python-scipy python-requests \
    python-urllib3 python-pandas
RUN pip install matplotlib --upgrade
RUN pip install pandas --upgrade
RUN pip install seaborn
RUN pip install pydicom=0.9.9

# Install dax 
RUN pip install https://github.com/VUIIS/dax/archive/v0.7.1.zip

# Install FreeSurfer v6.0.0
RUN apt-get update -qq && apt-get install -yq --no-install-recommends bc libgomp1 libxmu6 libxt6 tcsh perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "Downloading FreeSurfer ..." \
    && curl -sSL --retry 5 \
    https://www.dropbox.com/s/96fejazytcoaiay/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0_MinimumForDocker.tgz \
    | tar xz -C /opt
ENV FREESURFER_HOME=/opt/freesurfer

# Install recon-stats
COPY src /opt/src/
WORKDIR /opt/src/recon-stats
RUN python setup.py install

# Make sure other stuff is in path
RUN chmod +x /opt/src/make_screenshots.sh
ENV PATH=/opt/src:$PATH

# Make directories for I/O to bind
RUN mkdir /INPUTS /OUTPUTS

# Get the spider code
COPY spider.py /opt/spider.py
ENTRYPOINT ["python", "/opt/spider.py"]
