# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

FROM 	   carlosjustino/wso2-os-base
MAINTAINER Carlos Eduardo Justino <carlos.justino@datacoper.com.br>


ARG JAVA_MAX_MEM
ENV JAVA_MAX_MEM ${JAVA_MAX_MEM:-2G}

ARG JAVA_START_MEM
ENV JAVA_START_MEM ${JAVA_START_MEM:-500m}

ENV JAVA_OPTS="-Xms$JAVA_START_MEM -Xmx$JAVA_MAX_MEM"

RUN echo "JAVA_OPTS="$JAVA_OPTS

WORKDIR /opt

RUN mkdir wso2

###########################################
# Configure WSO2 Application Server - 5.3.0
###########################################

WORKDIR /opt/wso2

ADD packs/wso2as-5.3.0.zip /opt/wso2/
RUN unzip -q wso2as-5.3.0.zip
RUN rm wso2as-5.3.0.zip
RUN ln -snf /opt/wso2/wso2as-5.3.0 producaoApp

VOLUME ["/opt/wso2/producaoApp/repository/conf" , "/opt/wso2/producaoApp/repository/database", "/opt/wso2/producaoApp/repository/deployment/server"]


COPY files/conf /opt/wso2/producaoApp/repository/conf

COPY files/database /opt/wso2/producaoApp/repository/database

COPY files/server /opt/wso2/producaoApp/repository/deployment/server

EXPOSE 9443 9763 8243 8280 5000

###################
# Setup run script
###################
ENV JAVA_HOME /opt/java
ENV PATH=$PATH:/opt/java/bin

RUN java -version

CMD ["/opt/wso2/producaoApp/bin/wso2server.sh"]