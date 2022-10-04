#!/bin/sh

echo "Downloading and Installing JDK..."
wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
mv jdk-13.0.1 /opt/

echo "Setting JDK Env."
JAVA_HOME='/opt/jdk-13.0.1'
PATH="$PATH:$JAVA_HOME/bin"
export PATH

echo "Verify java version"
java -version

