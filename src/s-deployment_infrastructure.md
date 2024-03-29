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
* goal: scalability
* distribute incoming requests among multiple servers

Two design dimensions:

* Request routing
  * naming:
    Resolve same DNS name to multiple IP addresses, usually in a round-robin strategy.
    This resolves the DNS resolution equally, but this might not balance the load equally.
    It would also be feasible here to distribute based on source IP.
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
* client directly routed to CDN servers

## Cloud Computing
Model for enabling on demand access to shared pool of computing resources,
which can be rapidly provisioned with minimal effort and interaction.

Characteristics of cloud services:

* on-demand self service
* network access via standard interfaces
* resource pooling (multiplexing, virtualization)
* elasticity: fast adaptation and scaling
* measured service: pay as you go

Deployment Models:

* private cloud
* community cloud
* public cloud
* (hybrid models)

### Service Models
#### Infrastructure as a Service IaaS
* computing instance
  * physical or virtual (typically VM)
  * initialized using image
* network
  * bridges/routers
* storage
  * disk-level (block storage)
  * file-level (e.g. S3) (i think this should be "object storage"?)
* containers

#### Platform as a Service PaaS
* examples of platforms:
  * servlet container
  * FastCGI
* abstracts away everything below application level
* typically includes adjacent services

Storage:

* platforms for storage services
* mostly database-like, such as SQL database as a service
* caching services (in-memory)

#### Software as a Service SaaS
* maintained application and hardware
* e.g. google docs

### Virtualization
* cloud: typically hypervisor based virtualization

## Advanced Topics
### Monitoring
* allows quantifiable metrics and shows if systems provide intended service
* enables scaling decisions
* see [performance metrics](#server-side-performance-metrics)
* host/system monitoring
  * CPU load, disk usage, etc
* application monitoring
  * response times, resource usage, end-user experience
* network monitoring
  * performance, availability, configuration
* pitfalls:
  * observer effect: monitoring might influence system under observation
  * not enough data: problems not identified
  * too much data: problem might be obscured or drowned out
* security:
  * identification of intrusions or misbehavior
* distributed monitoring
  * aggregation of monitoring data
  * visualization

### Logging
* tracing of service behavior (compared to monitoring, which provides quantification)
* logs originate from applications or system
* structured, containing metadata such as source and timestamp
* can be aggregated (over network)
  * time-series database
* distributed services:
  * challenges with formats, time bases, etc
  * might require unification of formats among components
  * correlation of log entries which correspond to single request/transaction (e.g. via unique ID)
  * clock synchronization of hosts

### Microservices

Service Composition:

* service-oriented architecture
  * compose services of other services
  * functional decomposition
* horizontal decomposition
  * technical aspects drive modules (load balancer, container, database)
* vertical decomposition
  * composition according to business logic (example: accounting, payment, customer relationship)
  * microservices

Microservices:

* vertical decomposition
  * each microservice full stack (each service contains logic, database, UI, load balancer)
  * communication between services, e.g. via REST, RPC
  * services decoupled from each other
  * advantages:
    * independent development
    * can use own technology, which might not be appropriate for other services
    * individual scaling
  * disadvantages:
    * business data spread over multiple DBs (-> consistency)
* independent and evolutionary development
  * independence due to well defined interfaces
  * assumption of continuous development
  * small development team covers entire development and operation
  * disadvantages: duplicate developments, interfaces expensive to change
* small size
  * large enough to overcome deployment overhead, but usually no team growth
