apt-get update -y
apt install openjdk-8-jdk -y
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
source ~/.bashrc
echo $JAVA_HOME

cd /opt

wget https://archive.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz
tar xzf apache-flume-1.9.0-bin.tar.gz
cd apache-flume-1.9.0-bin

echo "export PATH=$PATH:/opt/apache-flume-1.9.0-bin/bin" >> ~/.bashrc

source ~/.bashrc
flume-ng version

cp /vagrant/flume.conf /opt/apache-flume-1.9.0-bin/conf/
#flume-ng agent –conf ./conf/ -f conf/flume.conf -n agent1 -Dflume.root.logger=DEBUG
cd /opt/apache-flume-1.9.0-bin/
flume-ng agent --conf /opt/apache-flume-1.9.0-bin/conf --conf-file /opt/apache-flume-1.9.0-bin/conf/flume.conf --name a1 Dflume.root.logger=INFO,console &> /opt/apache-flume-1.9.0-bin/conf/logs/agent.log &

echo "Please run this command: telnet localhost 44444 and send any characters to the console. You will be able to see the same characters in /opt/apache-flume-1.9.0-bin/logs/flume.log"

#Custom plugin
mkdir -p /opt/apache-flume-1.9.0-bin/logs
cd /opt
apt-get install maven -y
git clone https://github.com/jjmleiro/flume-custom-source.git
cd flume-custom-source
mvn package
cp /opt/flume-custom-source/target/flume-custom-source-0.0.1-SNAPSHOT.jar /opt/apache-flume-1.9.0-bin/lib

cp /vagrant/flume_custom.conf /opt/apache-flume-1.9.0-bin/conf/
cd /opt/apache-flume-1.9.0-bin/
flume-ng agent --conf /opt/apache-flume-1.9.0-bin/conf --conf-file /opt/apache-flume-1.9.0-bin/conf/flume_custom.conf --name a1 Dflume.root.logger=INFO,console &> /opt/apache-flume-1.9.0-bin/logs/agent_custom.log &