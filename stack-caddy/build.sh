#!/bin/bash

docker build -t mycaddy .

if [ $? -eq 0 ]; then
    echo "Docker image 'mycaddy' built successfully!"
else
    echo "Failed to build the Docker image."
fi
