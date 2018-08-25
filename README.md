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

