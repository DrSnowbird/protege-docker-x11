FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## ---- USER_NAME is defined in parent image: openkbs/jre-mvn-py3-x11 already ----
#ENV USER_NAME=${USER_NAME:-developer}
#ENV HOME=/home/${USER_NAME}

WORKDIR ${HOME}

#### ---- Protege ----
#ARG PROTEGE_VERSION=${PROTEGE_VERSION:-5.2.1}
#ENV PROTEGE_VERSION=${PROTEGE_VERSION}
ARG PROTEGE_HOME=${PROTEGE_HOME:-${HOME}/protege-x11}
ENV PROTEGE_HOME=${PROTEGE_HOME}

ARG PROTEGE_PLUGIN=${PROTEGE_PLUGIN:-{PROTEGE_HOME}/plugins}
ENV PROTEGE_PLUGIN=${PROTEGE_PLUGIN}

ENV PROTEGE_WORKSPACE=${HOME}/workspace-protege

# protege-docker-x11/protege/protege-desktop/target/protege-5.5.0-beta-3-SNAPSHOT-platform-independent/Protege-5.5.0-beta-3-SNAPSHOT
RUN sudo apt-get -y update \
    && sudo apt-get install graphviz -y \
    && git clone https://github.com/protegeproject/protege.git \
    && cd protege \
    && mvn -Dmaven.test.skip=true clean package \
    && ls -al ${HOME}/protege/protege-desktop/target/protege-*-SNAPSHOT-platform-independent/Protege-${PROTEGE_VERSION}* \
    && ln -s ${HOME}/protege/protege-desktop/target/protege-*-SNAPSHOT-platform-independent/Protege-${PROTEGE_VERSION}* ${PROTEGE_HOME} 

RUN sudo mkdir -p ${HOME}/.Protege ${PROTEGE_WORKSPACE} ${PROTEGE_PLUGIN} 
# && \
#    && chown -R ${USER_NAME}:${USER_NAME} ${HOME}/protege \
#    && chown -R ${USER_NAME}:${USER_NAME} ${PROTEGE_HOME} \
#    && mkdir -p ${PROTEGE_WORKSPACE}
#    sudo chown -R ${USER_NAME}:${USER_NAME} ${HOME}
    
## -- Protege --
VOLUME ${HOME}/.Protege

## -- Protege Workspace
VOLUME ${PROTEGE_WORKSPACE}

## -- Protege Plugin (to persist across multiple delete and create) --
VOLUME ${PROTEGE_PLUGIN}

USER ${USER_NAME}

CMD "${HOME}/protege-x11/run.sh"

