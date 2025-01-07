#!/bin/bash

function to_post() {
    find src/main/webapp/WEB-INF/views -type f -name "*.jsp" -exec sed -i 's/hx-put/hx-vals=\x27{"_method": "PUT"}\x27 hx-post/g' {} +
}

function to_put() {
    find src/main/webapp/WEB-INF/views -type f -name "*.jsp" -exec sed -i 's/hx-vals=\x27{"_method": "PUT"}\x27 hx-post/hx-put/g' {} +
}

case "$1" in
    "pre")
        echo "Converting PUT to POST..."
        to_post
        ;;
    "post")
        echo "Converting back to PUT..."
        to_put
        ;;
    *)
        echo "Usage: $0 {pre|post}"
        exit 1
        ;;
esac 