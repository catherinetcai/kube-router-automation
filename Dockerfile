FROM ghcr.io/ansible-community/community-ee-base:2.18.8-1

USER root:root

RUN dnf install -y dnf-plugins-core

RUN dnf config-manager addrepo --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

RUN dnf install -y terraform

RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

WORKDIR /workspace
