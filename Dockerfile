FROM ubuntu:trusty

# Install prereqs
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    apt-utils bzip2 ca-certificates curl unzip xorg wget xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chmod 777 /opt && chmod a+s /opt

# Install packages required by dax
RUN apt-get update && apt-get install -yq \
    python-pip libfreetype6-dev pkg-config libxml2-dev libxslt1-dev \
    python-dev zlib1g-dev python-numpy python-scipy python-requests \
    python-urllib3 python-pandas
RUN pip install matplotlib --upgrade
RUN pip install pandas --upgrade
RUN pip install seaborn
RUN pip install pydicom==0.9.9

# Install dax 
RUN pip install https://github.com/VUIIS/dax/archive/v0.7.1.zip

# Install FreeSurfer v6.0.1
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    bc libgomp1 libxmu6 libxt6 tcsh perl tar perl-modules \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "Downloading FreeSurfer ..." \
    && curl -sSL --retry 5 \
    https://www.dropbox.com/s/ncog7pqnyor40pu/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.1-MinimumForDocker.tgz \
    | tar xz -C /opt
ENV FREESURFER_HOME=/opt/freesurfer

# Install packages needed to use freeview
RUN apt-get update && apt-get install -y \
    libjpeg62 libglu1-mesa libqt4-opengl libqt4-scripttools

# Configure environment
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV FSLMULTIFILEQUIT=TRUE
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV OS Linux
ENV FS_OVERRIDE 0
ENV FIX_VERTEX_AREA=
ENV SUBJECTS_DIR /opt/freesurfer/subjects
ENV FSF_OUTPUT_FORMAT nii.gz
ENV MNI_DIR /opt/freesurfer/mni
ENV LOCAL_DIR /opt/freesurfer/local
ENV FREESURFER_HOME /opt/freesurfer
ENV FSFAST_HOME /opt/freesurfer/fsfast
ENV MINC_BIN_DIR /opt/freesurfer/mni/bin
ENV MINC_LIB_DIR /opt/freesurfer/mni/lib
ENV MNI_DATAPATH /opt/freesurfer/mni/data
ENV FMRI_ANALYSIS_DIR /opt/freesurfer/fsfast
ENV PERL5LIB /opt/freesurfer/mni/lib/perl5/5.8.5
ENV MNI_PERL5LIB /opt/freesurfer/mni/lib/perl5/5.8.5
ENV PATH=$PATH:/opt/freesurfer/bin:/opt/freesurfer/fsfast/bin:/opt/freesurfer/tktools:/opt/freesurfer/mni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHONPATH=""
ENV FS_LICENSE=/opt/license.txt
RUN touch /opt/license.txt

# Install packages needed make screenshots
RUN apt-get update && apt-get install -y \
    imagemagick ghostscript libgs-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
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
