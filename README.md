# Protégé Desktop Docker running over X11
[![](https://images.microbadger.com/badges/image/openkbs/protege-docker-x11.svg)](https://microbadger.com/images/openkbs/protege-docker-x11 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/protege-docker-x11.svg)](https://microbadger.com/images/openkbs/protege-docker-x11 "Get your own version badge on microbadger.com")
Desktop version Stanford Ontology IDE, Protege.
# Build
```
./build.sh
```

# Run
```
./run.sh
```

# Use
Three volumes are exposed to host:
* -- Protege Logs --
VOLUME ${HOME}/.Protege

* -- Protege Workspace --
VOLUME ${HOME}/Workspace

* -- Protege Plugin (to persist across multiple delete and create) --
This is to keep the installed plug-in libraries to be persistent for next restart/re-create of Container.
VOLUME ${HOME}/protege-x11/plugins

# Resources
* [Protégé](https://protege.stanford.edu/)
* [Protégé Desktop](https://github.com/protegeproject/protege)
