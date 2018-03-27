# Protégé Desktop Docker running over X11
[![](https://images.microbadger.com/badges/image/openkbs/protege-docker-x11.svg)](https://microbadger.com/images/openkbs/protege-docker-x11 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/protege-docker-x11.svg)](https://microbadger.com/images/openkbs/protege-docker-x11 "Get your own version badge on microbadger.com")
Desktop version Stanford Ontology IDE
* Protege version 5.2.0
# Build
```
./build.sh
```

# Run
```
./run.sh
```

# Volumes (no action needed - automated mapped in run.sh script)
Three volumes are exposed to host and already defined in "run.sh" script. Hence, you don't need to do anything for the following volumes inside the Docker file and they are mapped to directories under your "$HOME/data-docker/protege_docker_x11".

* Protege related files including Logs:
${HOME}/.Protege

* Protege Workspace:
${HOME}/Workspace

* Protege Plugin (to persist across multiple delete and create of Protege Docker container) --
This is to keep the installed plug-in libraries to be persistent for next restart/re-create of Container.
${HOME}/protege-x11/plugins

# Resources
* [Protégé](https://protege.stanford.edu/)
* [Protégé Desktop](https://github.com/protegeproject/protege)
