#!/bin/bash
cd /host/java/
javac -cp .:selenium-server-standalone-3.13.0.jar GoogleSeleniumTest.java
javac -cp .:selenium-server-standalone-3.13.0.jar DownloadServicePackTest.java
