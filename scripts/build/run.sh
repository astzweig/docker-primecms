#!/bin/sh

install_dependencies () {
    apk add --no-cache git python3 python3-dev npm;
    npm install -g typescript;
    pip3 install cocof;
}

main () {
    install_dependencies;
}

main;
