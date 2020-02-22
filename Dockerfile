FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="protege-docker-x11" \
      org.label-schema.description="Protege - Ontology (RDF/OWL) Desktop IDE Editor" \
      org.label-schema.url="https://bigdata.openkbs.org/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/DrSnowbird/protege-docker-x11" \
      org.label-schema.vendor="OpenKBS.org" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
          
## ---- USER_NAME is defined in parent image: openkbs/jdk-mvn-py3-x11 already ----

WORKDIR ${HOME}

###########################################################################
#### ---- DO NOT CHANGE Below unless release location changed    ---- #####
###########################################################################
# Use release:
# https://github.com/protegeproject/protege-distribution/releases/download/v5.5.0/Protege-5.5.0-linux.tar.gz
ENV PROTEGE_VERSION=5.5.0
ARG PROTEGE_TGZ=https://github.com/protegeproject/protege-distribution/releases/download/v${PROTEGE_VERSION}/Protege-${PROTEGE_VERSION}-linux.tar.gz
ENV PROTEGE_HOME=${HOME}/Protege-${PROTEGE_VERSION}
RUN wget -c ${PROTEGE_TGZ} && tar xvfz ${PROTEGE_TGZ} && \
    cd Protege-${PROTEGE_VERSION} && \
    ls -al ${PROTEGE_HOME}

## -- Protege --
VOLUME ${HOME}/.Protege

## -- Protege Workspace
VOLUME ${PROTEGE_WORKSPACE}

## -- Protege Plugin (to persist across multiple delete and create) --
VOLUME ${PROTEGE_PLUGIN}

USER ${USER}
WORKDIR ${HOME}

CMD "${PROTEGE_HOME}/run.sh"

