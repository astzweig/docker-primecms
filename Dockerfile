FROM node:alpine as builder
LABEL org.label-schema.vendor = "Astzweig UG(haftungsbeschränkt) & Co. KG"
LABEL org.label-schema.version = "1.0.0"
LABEL org.label-schema.description = "A docker container to build Prime CMS."
LABEL org.label-schema.vcs-url = "https://github.com/astzweig/docker-primecms"
LABEL org.label-schema.schema-version = "1.0"

ARG SCRIPT_DIR=/root/scripts
ARG BUILD_DIR=/root/primecms
ARG PRIMECMS_GIT_REPO=https://github.com/birkir/prime.git
ARG PRIMECMS_GIT_CID=171d934ef10f1631b5083f20d35979ad4464894f

WORKDIR ${BUILD_DIR}
RUN apk add --no-cache git npm 
RUN git clone "${PRIMECMS_GIT_REPO}" "${BUILD_DIR}" && \
    cd "${BUILD_DIR}" && \
    git checkout "${PRIMECMS_GIT_CID}"
RUN while true; do yarn install; test $? -eq 0 && break; sleep 1; done
RUN yarn setup
RUN yarn compile


FROM alpine:latest
LABEL org.label-schema.vendor = "Astzweig UG(haftungsbeschränkt) & Co. KG"
LABEL org.label-schema.version = "1.0.0"
LABEL org.label-schema.description = "A docker container to run Prime CMS."
LABEL org.label-schema.vcs-url = "https://github.com/astzweig/docker-primecms"
LABEL org.label-schema.schema-version = "1.0"
RUN apk add --no-cache dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
