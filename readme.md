# Inexor Docker Built

This repository builds a Docker built on [Docker Hub](https://hub.docker.com/r/inexorgame/ci-docker/). We are using this builts then on our CI services. This saves a lot of CI time compared to building the Docker images every time from scratch.

Every push triggers a new build. However please keep in mind:
 
> You can only trigger one build at a time and no more than one every five minutes. If you already have a build pending, or if you recently submitted a build request, Docker ignores new requests.

Try to prevent commit more often.

Different Docker images with e.g. different operating systems and configs should be possible with different branches. Docker should then create different tags. However, this is untested at the time of writing, also it is not clear if we need this.

