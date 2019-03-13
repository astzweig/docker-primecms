FROM node:alpine
LABEL org.label-schema.vendor = "Astzweig UG(haftungsbeschränkt) & Co. KG"
LABEL org.label-schema.version = "1.0.0"
LABEL org.label-schema.description = "A docker container to run Prime CMS."
LABEL org.label-schema.vcs-url = "https://github.com/astzweig/docker-primecms"
LABEL org.label-schema.schema-version = "1.0"
RUN apk add --no-cache dumb-init;

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
