#Subsonic StandAlone Docker Image
FROM ubuntu:14.04
RUN echo "Subsonic StandAlone Docker Image (v5.2.1)"
RUN locale-gen en_US.UTF-8  
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
  openjdk-7-jre-headless \
  wget \
  flac \
  lame

ENV SUBSONIC_VERSION 5.2.1

RUN mkdir -p /opt/subsonic
RUN wget -qO- http://downloads.sourceforge.net/project/subsonic/subsonic/$SUBSONIC_VERSION/subsonic-$SUBSONIC_VERSION-standalone.tar.gz | tar xvz -C /opt/subsonic

RUN mkdir -p /var/subsonic/transcode
RUN ln -s "$(which flac)" /var/subsonic/transcode/flac
RUN ln -s "$(which lame)" /var/subsonic/transcode/lame

ENV LANG en_US.UTF-8  
ENV LC_ALL en_US.UTF-8

VOLUME ["/var/music", "/var/subsonic"]
CMD /bin/bash -c "export LANG=en_US.UTF-8 && /opt/subsonic/subsonic.sh && /bin/bash"

EXPOSE 4040
