# Protégé Desktop Docker running over X11
[![](https://images.microbadger.com/badges/image/openkbs/protege-docker-x11.svg)](https://microbadger.com/images/openkbs/protege-docker-x11 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/protege-docker-x11.svg)](https://microbadger.com/images/openkbs/protege-docker-x11 "Get your own version badge on microbadger.com")
Desktop version Stanford Ontology IDE
* Protégé version 5.5 (from latest GIT)

# Components
* java version "1.8.0_181"
  Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
  Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)
* Apache Maven 3.5.3
* Python 3.5.2
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

# Run (Recommended for easy starting-up)
This will setup all the needed host directory to ensure Protégé configurations being persistent for next run.
```
./run.sh
```
# Build (Locally build your own image)
```
./build.sh
```

# Volumes (no action needed - automated mapped in run.sh script)
Three volumes are exposed to host and already defined in "run.sh" script. Hence, you don't need to do anything for the following volumes inside the Docker file and they are mapped to directories under your "$HOME/data-docker/protege_docker_x11".

* Protégé related files including Logs:
${HOME}/.Protege

* Protégé Workspace:
${HOME}/Workspace

* Protégé Plugin (to persist across multiple delete and create of Protégé Docker container) --
This is to keep the installed plug-in libraries to be persistent for next restart/re-create of Container.
${HOME}/protege-x11/plugins

# Resources
* [Protégé](https://protege.stanford.edu/)
* [Protégé Desktop - source](https://github.com/protegeproject/protege)
* [WebProtege](https://webprotege.stanford.edu)

# See Also
* [Web-based Protege Docker by openkbs/docker-webprotege](https://hub.docker.com/r/openkbs/docker-webprotege/)

# Releases
```
developer@solar01:~$ /usr/scripts/printVersions.sh 
+ echo JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
+ java -version
openjdk version "1.8.0_242"
OpenJDK Runtime Environment (build 1.8.0_242-8u242-b08-0ubuntu3~18.04-b08)
OpenJDK 64-Bit Server VM (build 25.242-b08, mixed mode)
+ mvn --version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /usr/apache-maven-3.6.3
Java version: 1.8.0_242, vendor: Private Build, runtime: /usr/lib/jvm/java-8-openjdk-amd64/jre
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "5.3.0-42-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.15+
+ python3 -V
Python 3.6.9
+ pip --version
pip 20.0.2 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ pip3 --version
pip 20.0.2 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
+ gradle --version

Welcome to Gradle 6.0.1!

Here are the highlights of this release:
 - Substantial improvements in dependency management, including
   - Publishing Gradle Module Metadata in addition to pom.xml
   - Advanced control of transitive versions
   - Support for optional features and dependencies
   - Rules to tweak published metadata
 - Support for Java 13
 - Faster incremental Java and Groovy compilation
 - New Zinc compiler for Scala
 - VS2019 support
 - Support for Gradle Enterprise plugin 3.0

For more details see https://docs.gradle.org/6.0.1/release-notes.html


------------------------------------------------------------
Gradle 6.0.1
------------------------------------------------------------

Build time:   2019-11-18 20:25:01 UTC
Revision:     fad121066a68c4701acd362daf4287a7c309a0f5

Kotlin:       1.3.50
Groovy:       2.5.8
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          1.8.0_242 (Private Build 25.242-b08)
OS:           Linux 5.3.0-42-generic amd64

+ npm -v
6.13.7
+ node -v
v13.9.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04.2 LTS"
NAME="Ubuntu"
VERSION="18.04.2 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.2 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
```
