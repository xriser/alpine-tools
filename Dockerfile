FROM alpine:latest

ARG YQ_VERSION="3.3.2"

RUN apk add --no-cache bash openssh-client rsync sed git gawk grep jq ca-certificates openssl
RUN mkdir -p ~/.ssh
RUN echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

RUN wget -q https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -O /usr/local/bin/yq \
    && chmod +x /usr/local/bin/yq
