# Protege Desktop running over X11

# Build
'''
./build.sh
'''

# Run
'''
./run.sh
'''

# Use
Three volumes are exposed to host:
* -- Protege Logs --
VOLUME ${HOME}/.Protege

* -- Protege Workspace --
VOLUME ${HOME}/Workspace

* -- Protege Plugin (to persist across multiple delete and create) --
This is to keep the installed plug-in libraries to be persistent for next restart/re-create of Container.
VOLUME ${HOME}/protege-x11/plugins
