# pyzor-cc
Dockerized pyzor client running as python daemon

# Usage
` docker run -d -p 127.0.0.1:5953:5953 -e LISTEN_PORT=5953 --name pyzor-cc neomediatech/pyzor-cc `

If you want to use custom pyzor server (like neomediatech/pyzor-server) bind mount configuration file with your ip/name pyzor server server, eg:  
` docker run -d -p 127.0.0.1:5953:5953 -e LISTEN_PORT=5953 --name pyzor-cc -v /path/to/pyzor-server-conf/servers:/root/.pyzor/servers neomediatech/pyzor-cc `  

`servers` file will have ip/server name:port lines(s)  like:  
pyzor.somedomain.tld:24441  
