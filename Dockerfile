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
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}

WORKDIR ${HOME}

###########################################################################
#### ---- Protege build vars (change using .env environment file) ---- ####
###########################################################################

## -- Protege Source GIT repo ---
ARG PROTEGE_SOURCE_GIT=${PROTEGE_SOURCE_GIT:-https://github.com/protegeproject/protege.git}
#ARG PROTEGE_SOURCE_GIT=${PROTEGE_SOURCE_GIT:-https://github.com/DrSnowbird/protege.git}
#ARG PROTEGE_SOURCE_GIT=${PROTEGE_SOURCE_GIT:-git@github.com:DrSnowbird/protege.git}

## -- Protege Source base directory for GIT clone ---
ARG PROTEGE_BASE_DIR=${PROTEGE_BASE_DIR:-protege-x11}

###########################################################################
#### ---- DO NOT CHANGE Below unless GIT souce structure changed ---- #####
###########################################################################
ARG PROTEGE_HOME=${PROTEGE_HOME:-${HOME}/${PROTEGE_BASE_DIR}}
ENV PROTEGE_HOME=${PROTEGE_HOME}

ARG PROTEGE_PLUGIN=${PROTEGE_PLUGIN:-{PROTEGE_HOME}/plugins}
ENV PROTEGE_PLUGIN=${PROTEGE_PLUGIN}

ENV PROTEGE_WORKSPACE=${HOME}/workspace-protege

# protege-docker-x11/protege/protege-desktop/target/protege-5.5.0-beta-3-SNAPSHOT-platform-independent/Protege-5.5.0-beta-3-SNAPSHOT
RUN sudo apt-get -y update \
    && sudo apt-get install graphviz -y \
    && git clone ${PROTEGE_SOURCE_GIT} \
    && cd protege \
    && mvn -Dmaven.test.skip=true clean package \
    && ls -al ${HOME}/protege/protege-desktop/target/protege-*-SNAPSHOT-platform-independent/Protege-${PROTEGE_VERSION}* \
    && ln -s ${HOME}/protege/protege-desktop/target/protege-*-SNAPSHOT-platform-independent/Protege-${PROTEGE_VERSION}* ${PROTEGE_HOME} 

RUN sudo mkdir -p ${HOME}/.Protege ${PROTEGE_WORKSPACE} ${PROTEGE_PLUGIN} 
    
## -- Protege --
VOLUME ${HOME}/.Protege

## -- Protege Workspace
VOLUME ${PROTEGE_WORKSPACE}

## -- Protege Plugin (to persist across multiple delete and create) --
VOLUME ${PROTEGE_PLUGIN}

USER ${USER_NAME}

CMD "${HOME}/protege-x11/run.sh"

