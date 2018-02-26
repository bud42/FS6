FROM conda/miniconda2-centos6

RUN yum -y update && \
    yum install -y -q bzip2 ca-certificates curl epel-release unzip gcc \
    && yum clean packages \
    && rm -rf /var/cache/yum/* /tmp/* /var/tmp/*

# Install dax
RUN pip install https://github.com/VUIIS/dax/archive/v0.7.1.zip

# Install FreeSurfer v6.0.0
RUN yum install -y -q bc libgomp libXmu libXt tcsh perl \
    && yum clean packages \
    && rm -rf /var/cache/yum/* /tmp/* /var/tmp/*
RUN echo "Downloading FreeSurfer ..." \
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

# Get the spider code
COPY spider.py /opt/spider.py
ENTRYPOINT ["python", "/opt/spider.py"]
