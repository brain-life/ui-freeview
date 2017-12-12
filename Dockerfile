#FROM ubuntu:14.04
FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER Soichi Hayashis <hayashis@iu.edu>

EXPOSE 5900
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    vim curl tightvncserver xfce4 \
    tcsh libglu1-mesa libgomp1 libjpeg62

RUN curl ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz | tar xz -C /usr/local
ENV FREESURFER_HOME=/usr/local/freesurfer

#RUN wget https://sourceforge.net/projects/virtualgl/files/2.5.2/virtualgl_2.5.2_amd64.deb/download -O virtualgl.deb && dpkg -i virtualgl.deb
ADD virtualgl_2.5.2_amd64.deb /
RUN dpkg -i /virtualgl_2.5.2_amd64.deb

RUN apt-get install -y mesa-utils 

ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]


