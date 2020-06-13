## Gitea

Github is amazing. But there are time when having my own super-special-private Github is better. For the last year or so, I've used Gitea for self-hosted Github (mostly for things I've been too embaressed to publish. Gitea is a FOSS clone of Github. 

(Gitea)[https://gitea.io/en-us/] is lightweight and can even run on your Synology NAS. 

## Podman

As a developer who has the privilege to work on Red Hat and Fedora CoreOS, I am a fan of (Podman)[https://podman.io/]. The problem is that most of the documentation for running Gitea use Docker-compose.  There is a (podman-compose)[https://github.com/containers/podman-compose], however I've found it to a bit lacking. 

## The Solution?

How about a simple script? If you want to create your own podman incepted Gitea insance, this script should do the trick. 

