#!/bin/bash
echo "installing go"

# Install pre-reqs
sudo apt-get install python3 git -y

# Install Go
sudo apt-get install golang-go -y

export GOROOT=/usr/lib/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOBIN

go --version
