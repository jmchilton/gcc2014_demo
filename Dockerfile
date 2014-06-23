# Collections Example Docker Container
#
# VERSION       0.1.0

FROM ubuntu
MAINTAINER John Chilton <jmchilton@gmail.com>

RUN apt-get update
RUN apt-get install -y wget unzip python-setuptools samtools openjdk-7-jdk
# TODO: Redo above line with headless jdk.
RUN easy_install http://depot.galaxyproject.org/package/source/galaxy_sequence_utils/galaxy_sequence_utils-1.0.0.tgz
RUN wget http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.2.3/bowtie2-2.2.3-linux-x86_64.zip
RUN unzip bowtie2-2.2.3-linux-x86_64.zip
RUN mv bowtie2-2.2.3/bowtie2* /usr/local/bin/

RUN wget http://downloads.sourceforge.net/project/picard/picard-tools/1.115/picard-tools-1.115.zip
RUN unzip picard-tools-1.115.zip
RUN mkdir /usr/local/share/jars
RUN mv picard-tools-1.115/* /usr/local/share/jars
RUN mv *jar /usr/local/share/jars

ENV JAVA_JAR_PATH /usr/local/share/jars
