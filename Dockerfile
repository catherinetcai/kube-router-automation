FROM ghcr.io/ansible-community/community-ee-base:2.18.8-1

USER root:root

RUN dnf install -y dnf-plugins-core \
  unzip \
  https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm

RUN dnf config-manager addrepo --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

RUN dnf install -y terraform

# Install go-task && aws-cli
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin \
  && curl -Lv "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \ 
  && unzip awscliv2.zip \
  && ./aws/install \ 
  && pip install boto3

WORKDIR /workspace
