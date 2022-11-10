#!/bin/bash

# download and run:
# curl -s https://raw.githubusercontent.com/dpchudasama2/public/main/script.bash | sudo bash

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

install_kafka(){
    wget https://downloads.apache.org/kafka/3.3.1/kafka_2.13-3.3.1.tgz
    tar -xvf kafka_2.13-3.3.1.tgz
    mv kafka_2.13-3.3.1 /opt/
    
    KAFKA_HOME="/opt/kafka_2.13-3.3.1"
    
    echo "Setting Kafka Env."
    echo 'KAFKA_HOME="/opt/kafka_2.13-3.3.1"' >> ~/.bashrc
    echo 'export PATH="$PATH:$KAFKA_HOME/bin"' >> ~/.bashrc

    echo "Creating data dirs"
    mkdir -p "$KAFKA_HOME/data/zookeeper"
    mkdir -p "$KAFKA_HOME/data/kafka"
    
    echo "Manual operation once"
    echo 'do override "dataDir=$KAFKA_HOME/data/zookeeper" in $KAFKA_HOME/config/zookeeper.properties'
    echo 'do override "log.dirs=$KAFKA_HOME/data/kafka" in $KAFKA_HOME/config/server.properties'

    echo "Restart and execute following commands for run (every time)"
    echo '[nohup] zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties [&]'
    echo '[nohup] kafka-server-start.sh $KAFKA_HOME/config/server.properties [&]'
}

echo "Please restart terminal, or execute '. ~/.bashrc'"
read -p "Press enter to continue"

. ~/.bashrc
