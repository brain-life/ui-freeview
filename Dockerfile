FROM ubuntu:14.04
#FROM brainlife/freesurfer
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xvfb x11vnc vim curl \
    lxde-core lxde-icon-theme lxterminal \
    mesa-utils libgl1-mesa-dri
#    gtk2-engines-murrine ttf-ubuntu-font-family firefox mesa-utils libgl1-mesa-dri gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine pinta arc-theme

#ENV USER root #vncserver uses this #vncserver uses this
#COPY password.txt .
#RUN cat password.txt password.txt | vncpasswd && rm password.txt

#RUN curl ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz | tar xvz -C /usr/local
RUN curl ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/5.3.0/freesurfer-Linux-centos6_x86_64-stable-pub-v5.3.0.tar.gz | tar xvz -C /usr/local
RUN apt-get install -y tcsh libglu1-mesa libgomp1 libjpeg62
ENV FREESURFER_HOME=/usr/local/freesurfer

ADD vnc.sh /opt
CMD ["/opt/vnc.sh"]

# Install autostart file for fslview
RUN mkdir -p /root/.config/autostart
ADD start.sh /
ADD start.desktop /root/.config/autostart

