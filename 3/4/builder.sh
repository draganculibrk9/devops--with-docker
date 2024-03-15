#!/bin/bash

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 GITHUB_REPOSITORY DOCKER_HUB_REPOSITORY"
    exit 1
fi

# Assign arguments to variables
GITHUB_REPOSITORY=$1
DOCKER_HUB_REPOSITORY=$2

GITHUB_URL="https://github.com/$GITHUB_REPOSITORY"

# Clone the GitHub repository
git clone $GITHUB_URL $GITHUB_REPOSITORY

# Check if clone was successful
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully"
else
    echo "Failed to clone repository"
    exit 1
fi

# Build and tag image
cd $GITHUB_REPOSITORY && docker build -t $DOCKER_HUB_REPOSITORY .

# Push the image to Docker Hub
docker login -p $DOCKER_PWD -u $DOCKER_USER
docker push $DOCKER_HUB_REPOSITORY