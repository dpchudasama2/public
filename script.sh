#!/bin/sh

# download and run:
# wget https://raw.githubusercontent.com/dpchudasama2/public/main/script.sh
# sudo chmod +777 script.sh
# sudo sh ./script.sh


echo "Downloading and Installing JDK..."
wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
mv jdk-13.0.1 /opt/

echo "Setting JDK Env."
echo 'JAVA_HOME="/opt/jdk-13.0.1"' >> ~/.bashrc
echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> ~/.bashrc

. ~/.bashrc

echo "Verify java version"
java -version


