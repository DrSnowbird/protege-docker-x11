FROM openkbs/jre-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

## ---- USER_NAME is defined in parent image: openkbs/jre-mvn-py3-x11 already ----
ENV USER_NAME=${USER_NAME:-developer}
ENV HOME=/home/${USER_NAME}

WORKDIR ${HOME}
RUN git clone https://github.com/protegeproject/protege.git \
    && cd protege \
    && mvn -Dmaven.test.skip=true clean package 

ENV PROTEGE_VERSION=${PROTEGE_VERSION:-5.2.1}
    
# protege/protege-desktop/target/protege-5.2.1-SNAPSHOT-platform-independent/Protege-5.2.1-SNAPSHOT
ENV PROTEGE_HOME=${HOME}/protege-x11
WORKDIR ${HOME}/protege

RUN mkdir -p ${HOME}/workspace \
#    && ln -s ${HOME}/protege/protege-*-SNAPSHOT-platform-independent/Protege-*-SNAPSHOT protege-x11 \
    && ln -s ${HOME}/protege/protege-desktop/target/protege-5.2.1-SNAPSHOT-platform-independent/Protege-5.2.1-SNAPSHOT ${HOME}/protege-x11 \
    && ls -al ${HOME}/protege/protege-desktop/target/protege-5.2.1-SNAPSHOT-platform-independent/Protege-5.2.1-SNAPSHOT \
    && echo "current dir=$PWD" \
    && echo "PROTEGE_HOME=${PROTEGE_HOME}" \
    && find ${HOME}/protege-x11 \
    && ls -al ${HOME}/protege-x11/* \
    && ls -al /home/developer/protege-x11/run.sh \
    && env
    
RUN apt-get update && apt-get install -y \
        libx11-6 libxext-dev libxrender-dev libxtst-dev \
        --no-install-recommends 
        
WORKDIR ${PROTEGE_HOME}

VOLUME ${HOME}/workspace
VOLUME ${HOME}/.protege

USER ${USER_NAME}

CMD "${HOME}/protege-x11/run.sh" "-Djava.awt.headless=true"

