#!/bin/bash
echo "compiling java selenium automated tests"
javac -cp .:/tmp/selenium-server-standalone-3.13.0.jar GoogleSeleniumTest.java
java -cp .:/tmp/selenium-server-standalone-3.13.0.jar GoogleSeleniumTest
