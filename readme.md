# Inexor Docker Builds

This repository builds Docker containers on [Docker Hub](https://hub.docker.com/r/inexorgame/ci-docker/). We are using these Docker containers on our CI services. This saves a lot of CI time compared to building the Docker images every time from scratch, increases the chance to reproduce the build significantly and makes it easier to debug.

Every push triggers a new build. However please keep in mind:

> You can only trigger one build at a time and no more than one every five minutes. If you already have a build pending, or if you recently submitted a build request, Docker ignores new requests.

Try to prevent committing more often.

Different Docker images with e.g. different operating systems and configs are easily possible if we need them. For now, we use only Ubuntu images for each compiler + compiler version we officially support.
