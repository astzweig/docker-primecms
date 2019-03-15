#!/bin/sh

cd "${INSTALL_DIR}/node_modules/@primecms/ui/build";
sed -i -e "s|src=\"/|src=\"${CORE_URL}/|g" -e "s|href=\"/|href=\"${CORE_URL}/|g" index.html;

cd "${INSTALL_DIR}";
if [ -z "$SESSION_SECRET" ]; then
    SESSION_SECRET="$(hexdump -n 10 -v -e '"%02X"' /dev/urandom)";
fi

echo > .env;
echo "SESSION_SECRET=${SESSION_SECRET}" >> .env;

node index.js
