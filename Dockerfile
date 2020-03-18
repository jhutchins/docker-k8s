FROM alpine:3.11

RUN apk add bash curl git openssl

# HELM
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sh

# HELMFILE
RUN wget https://github.com/roboll/helmfile/releases/latest/download/helmfile_linux_amd64 -O /usr/bin/helmfile; \
    chmod +x /usr/bin/helmfile

# HELM PLUGINS
RUN helm plugin install https://github.com/aslafy-z/helm-git
RUN HELM_PLUGIN_DIR=/root/.local/share/helm/plugins/helm-diff helm plugin install https://github.com/databus23/helm-diff

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl; \
    chmod +x ./kubectl; \
    mv ./kubectl /usr/local/bin/kubectl
