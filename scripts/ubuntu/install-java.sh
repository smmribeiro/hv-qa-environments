#!/bin/bash
echo "installing java $1"

if [ "$1" == "8" ] && [ "$2" == "16.04" ] ; then
	sudo add-apt-repository ppa:openjdk-r/ppa > /dev/null 2>&1

	sudo apt-get update > /dev/null 2>&1

	sudo apt-get install -y openjdk-8-jre > /dev/null 2>&1
	sudo apt-get install -y openjdk-8-jdk > /dev/null 2>&1

	sudo update-alternatives --config java > /dev/null 2>&1
	sudo update-alternatives --config javac > /dev/null 2>&1
fi

if [ "$1" == "8" ] && [ "$2" == "18.04" ] ; then
	sudo add-apt-repository ppa:openjdk-r/ppa > /dev/null 2>&1

	sudo apt-get update > /dev/null 2>&1

	sudo apt-get install -y openjdk-8-jre > /dev/null 2>&1
	sudo apt-get install -y openjdk-8-jdk > /dev/null 2>&1

	sudo update-alternatives --config java > /dev/null 2>&1
	sudo update-alternatives --config javac > /dev/null 2>&1
fi
