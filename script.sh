#!/bin/sh

# download and run:
# wget https://raw.githubusercontent.com/dpchudasama2/public/main/script.sh
# sudo chmod +777 script.sh
# sudo sh ./script.sh

if which java > /dev/null 2>&1; then
    echo "Java already installed"
    java -version
else
    echo "Downloading and Installing JDK..."
    wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
    tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
    mv jdk-13.0.1 /opt/

    echo "Setting JDK Env."
    echo 'JAVA_HOME="/opt/jdk-13.0.1"' >> ~/.bashrc
    echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> ~/.bashrc
fi
echo '=============================='

if which mvn > /dev/null 2>&1; then
    echo "Maven already installed"
    mvn --version
else
    echo "Downloading and Installing Maven..."
    wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
    tar -xvf apache-maven-3.6.3-bin.tar.gz
    mv apache-maven-3.6.3 /opt/

    echo "Setting Maven Env."
    echo 'M2_HOME="/opt/apache-maven-3.6.3"' >> ~/.bashrc
    echo 'export PATH="$PATH:$M2_HOME/bin"' >> ~/.bashrc
fi
echo '=============================='

#echo "Verify java version"
#java -version


