# Deployment/Infrastructure
## Backend Endpoints
### Proxies
* endpoint for HTTP requests
* main task: forwarding to server, usually also caching
* location: near the client
* purpose:
  * scalability
  * filtering
  * source obfuscation

#### Reverse Proxies:
* location: near the server
* purpose:
  * hides backend structure
  * filtering, caching, compression
  * security: TLS endpoint, maybe even authentication
  * load balancing
  * logging

Popular software:

* apache
* nginx
* HAProxy

### Load Balancing
* goal: scalabiltiy
* distribute incoming requests among multiple servers

Two design dimensions:
* Request routing
  * naming:
    Resolve same DNS name to multiple IP addresses, usually in a round-robin strategy.
    This resolves the DNS resolution equally, but this might not balance the load equally.
    It would also be feasable here to distribute based on source IP.
  * Application:
    A reverse proxy distributes HTTP requests.
    Here, a load based distribution strategy might be possible, if the proxy has access to load parameters of servers.
    Session stickiness ensures that all the requests of a single session reach the same backend server.
    This simplifies session state handling.
  * Transport:
    Reverse proxy distributes TCP connections.
    This has the advantage of being protocol agnostic.
* distribution strategies
  * round robin
  * load based
  * session based
  * source based

### CDNs
* 3rd party provider
* CDN handles (global) replication
* client direclty routed to CDN servers

## Cloud Computing
## Advanced Topics
