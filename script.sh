#!/bin/sh

# download and run:
# wget https://raw.githubusercontent.com/dpchudasama2/public/main/script.sh
# sudo chmod +777 script.sh
# sudo sh ./script.sh

function jdk_download(){
  echo "Downloading and Installing JDK..."
  wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
  tar -xvf openjdk-13.0.1_linux-x64_bin.tar.gz
  mv jdk-13.0.1 /opt/
}
function jdk_config_env(){
  echo "Setting JDK Env."
  JAVA_HOME='/opt/jdk-13.0.1'
  PATH="$JAVA_HOME/bin:$PATH"
  export PATH
#  echo 'JAVA_HOME="/opt/jdk-13.0.1"' >> ~/.bashrc
#  echo 'export PATH="$PATH:$JAVA_HOME/bin"' >> ~/.bashrc
}
function jdk_confirm(){
  javac --version
}


function mvn_download(){
  wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
  tar -xvf apache-maven-3.6.3-bin.tar.gz
  mv apache-maven-3.6.3 /opt/
}
function mvn_config_env(){
  M2_HOME='/opt/apache-maven-3.6.3'
  PATH="$M2_HOME/bin:$PATH"
  export PATH
}
function mvn_confirm(){
  mvn --version
}


function loadEnv(){
  sh ~/.bashrc
}

#echo "Verify java version"
#java -version


