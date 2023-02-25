# Static Web Content
## Web Servers

* HTTP endpoint which exposes HTTP endpoints
* Typical tasks:
  * Request parsing
  * URI resolving
  * Responding with appropriate content
* Content often provided by external components
* Offers SSL/TLS termination
* Might provide access control
* Might provide caching

### Static Content
* This represents a large amount of web resources
* Examples:
  * Immutable content (images, videos, static pages)
  * Static assets (stylesheets, JS sources)
* Server performance in this case predominantly I/O-bound (both disk and network)

### Architectures
#### multi-thread / multi-process
* One dedicated thread for accepting connections
* Dedicated thread per connections (spawned by first thread)
* Allows multiple concurrent connections
* Synchronous, blocking IO may be used
* Large number of connections make efficient scheduling challenging
* -> C10k Problem: Challenge of handling 10k concurrent connections to a server (early 2000s, now: C1M scale and beyond)

#### Solutions for the C10k Problem
* Avoid spawning many processes
* Avoid 1:1 mapping between connections and threads
* Using asynchronous and non-blocking I/O (reduces number of waiting threads)

#### Reactor Pattern
* Reactor: single thread with event-loop
  * reacts to IO events from a queue
  * dispatches events
* Event-specific handlers
  * process events produced by reactor
* Implemented in nginx: One master process + one worker per core
