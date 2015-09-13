# How the Web Works

1. IP address needed
  - DNS resolution chain: browser cache >> local HOSTS file >> Router's DNS >> ISPs DNS
  - Network stack uses ARP to find its configured DNS server if address not cached
  - IP address is found for hostname `google.com`

2. Browser asks OS to open a TCP connection to the resolved IP address
  - With an IP address, typical TCP connection flow follows:
    - OS calls the network stack to search for the next hop using a SYN request
    - SYNs and ACKs are traded between network nodes until the destination sever is reached
    - Path to host is now known
  - Server responds that it's ready to receive data
  - OS/Browser receives signal that the server is ready to receive data

3. HTTP protocol is started; GET request sent
  - Requests can contain headers (cookies, user-agents, tokens, query params)
  - If Request is POST, it can contain a Payload in addition to Headers

4. Server receives GET through the TCP/IP protocol
  - OS routes packet coming in on port 80 to a Web Server that's listening on port 80
  - Web Server routes request to some middleware
  - Middleware parses incoming string into Headers and Payloads and hands off to a Web Application Server
  - Web App routes incoming request to appropriate action based on the Method and Action used (GET /dogs)
  - Web App server generates a Response based on input
  - Server responds to Request by sending back a Response

5. Browser receives Response (big string)
  - Response/String is parsed into Response Headers and a Payload
  - Headers are read; cookies stored, etc
  - Browser parses the Payload (HTML)
  - If HTML contains links to other resources (*.js, css, images*) the process starts all over again

6. Browser renders the parsed Response's payload
  - The _load_ event is fired when a resource and its dependent resources have finished loading
