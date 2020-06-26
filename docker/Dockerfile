FROM openjdk:8

ENV DOWNLOAD_DIR /opt/downloadpacks/target/downloadpacks

USER root
WORKDIR /opt/
COPY downloadpacks downloadpacks/
COPY conf conf/
RUN downloadpacks/downloadpacks.sh download

RUN echo "HOLEEEEEEEEEEEEEEEEEEE"
RUN tar -zxf ${DOWNLOAD_DIR}/zookeeper.tar.gz
RUN mv apache-zookeeper-3.6.1-bin /usr/local/zookeeper && \
        mkdir -p /var/lib/zookeeper && \
        mv conf/zoo.cfg /usr/local/zookeeper/conf/ && \
        /usr/local/zookeeper/bin/zkServer.sh start

CMD /bin/bash
