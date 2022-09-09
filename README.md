# flume-vagrant
flume-vagrant

This repo brings up the VM, deploys flume on it and runs two agents  

The two agents that run are:    
flume-ng agent --conf /opt/apache-flume-1.9.0-bin/conf --conf-file /opt/apache-flume-1.9.0-bin/conf/flume.conf --name a1 Dflume.root.logger=INFO,console &> /opt/apache-flume-1.9.0-bin/conf/logs/agent.log &  
    Telnet to logs  
    Run "telnet localhost 44444" and send data here to see it in the logs  
flume-ng agent --conf /opt/apache-flume-1.9.0-bin/conf --conf-file /opt/apache-flume-1.9.0-bin/conf/flume_custom.conf --name a1 Dflume.root.logger=INFO,console &> /opt/apache-flume-1.9.0-bin/logs/agent_custom.log &  
    File to logs  
    The file /vagrant/test_flume.txt is going to be processed. 
    





