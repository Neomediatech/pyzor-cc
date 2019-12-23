# pyzor-cc
Dockerized pyzor client running as python daemon

# Why?
To let rspamd use pyzor as one more tool to fight spam  

# Usage
` docker run -d -p 127.0.0.1:5953:5953 -e LISTEN_PORT=5953 --name pyzor-cc neomediatech/pyzor-cc `

If you want to use custom pyzor server (like neomediatech/pyzor-server) set PYZOR_SERVER env var eg:  
` docker run -d -p 127.0.0.1:5953:5953 -e LISTEN_PORT=5953 -e PYZOR_SERVER=yourserver.domain.tld --name pyzor-cc neomediatech/pyzor-cc `  

